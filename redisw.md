### redis

#### 1.安装

gcc-c++

make 

make install PREFIX=/usr/local/redis

vim redis.conf

bind 0.0.0.0

daemonize yes

requirepass 123

### error

private属性不能被继承

## springboot 静态资源加载

```
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/META-INF/resources/")
                .addResourceLocations("file:///home/zyl/Documents/imooc-video-dev/");
    }
}
```



