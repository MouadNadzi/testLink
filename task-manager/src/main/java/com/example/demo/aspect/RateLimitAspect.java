package com.example.demo.aspect;

import com.github.benmanes.caffeine.cache.LoadingCache;
import com.example.demo.exception.RateLimitExceededException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
@RequiredArgsConstructor
public class RateLimitAspect {

    private final LoadingCache<String, Integer> requestCountsCache;
    private final int MAX_REQUESTS_PER_MINUTE = 60;

    @Around("@annotation(com.example.demo.annotation.RateLimit)")
    public Object rateLimit(ProceedingJoinPoint joinPoint) throws Throwable {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        String clientIp = getClientIP(request);

        Integer requests = requestCountsCache.get(clientIp);
        if (requests >= MAX_REQUESTS_PER_MINUTE) {
            throw new RateLimitExceededException("Rate limit exceeded. Try again in 1 minute.");
        }

        requestCountsCache.put(clientIp, requests + 1);
        return joinPoint.proceed();
    }

    private String getClientIP(HttpServletRequest request) {
        String xfHeader = request.getHeader("X-Forwarded-For");
        if (xfHeader == null) {
            return request.getRemoteAddr();
        }
        return xfHeader.split(",")[0];
    }
}