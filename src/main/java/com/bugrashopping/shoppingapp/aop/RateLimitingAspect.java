package com.bugrashopping.shoppingapp.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

@Aspect
@Component
public class RateLimitingAspect {

    private Map<String, RequestRateLimiter> rateLimiterMap = new ConcurrentHashMap<>();

    @Around("@annotation(rateLimited)")
    public Object rateLimit(ProceedingJoinPoint joinPoint, RateLimited rateLimited) throws Throwable {
        String key = generateKey(joinPoint);

        RequestRateLimiter rateLimiter = rateLimiterMap.computeIfAbsent(key, k ->
                new RequestRateLimiter(rateLimited.timeWindow(), rateLimited.maxRequests())
        );

        if (rateLimiter.allowRequest()) {
            return joinPoint.proceed();
        } else {
            throw new RuntimeException("Rate limit exceeded. Please try again later.");
        }
    }

    private String generateKey(ProceedingJoinPoint joinPoint) {
        return joinPoint.getSignature().toString();
    }

    private static class RequestRateLimiter {
        private final long timeWindowMillis;
        private final int maxRequests;
        private int requestCount;
        private long windowStart;

        public RequestRateLimiter(int timeWindow, int maxRequests) {
            this.timeWindowMillis = TimeUnit.SECONDS.toMillis(timeWindow);
            this.maxRequests = maxRequests;
            this.windowStart = System.currentTimeMillis();
            this.requestCount = 0;
        }

        public synchronized boolean allowRequest() {
            long now = System.currentTimeMillis();
            if (now - windowStart > timeWindowMillis) {
                windowStart = now;
                requestCount = 0;
            }
            requestCount++;
            return requestCount <= maxRequests;
        }
    }
}
