package com.example.pg.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
 
@Configuration
public class SwaggerConfig {
 
    @Bean
    public OpenAPI pgOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("PG Accommodation API")
                        .description("PG Accommodation Management System")
                        .version("1.0"));
    }
}
 