package com.backend.mundoAnimal.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class HttpsConfig {
    @Bean
    public FilterRegistrationBean forceHttps() {
        FilterRegistrationBean filter = new FilterRegistrationBean();
        filter.setFilter(new org.springframework.web.filter.RequestContextFilter());
        filter.addUrlPatterns("/*");
        return filter;
    }
}