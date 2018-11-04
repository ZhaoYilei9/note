## springboot整合fdfs

### １．添加项目依赖

​	

```
		<dependency>
                <groupId>com.github.tobato</groupId>
                <artifactId>fastdfs-client</artifactId>
                 <version>1.26.1-RELEASE<version>
        </dependency>
```

### ２．将fdfs配置引入文件中

```
        @SpringBootApplication
        @EnableDiscoveryClient
        @Import(FdfsClientConfig.class)
        public class UploadService {
            public static void main(String[] args) {
                SpringApplication.run(UploadService.class,args);
            }
        }
```

### 3.在application.yml中添加配置

```
        fdfs:
          soTimeout: 1500
          connectTimeout: 600
          thumbImage:             #缩略图生成参数
            width: 150
            height: 150
          trackerList:            #TrackerList参数,支持多个
            - 172.17.0.2:22122
            - 172.17.0.2:22122 
```

### 4.在项目使用

