###solr 配置：

①复制/solr-4.10.3/dist/solr-4.10.3.war到usr/local/solr/tomcat/webapps/

②solrj是solr的客户端

③ /solr-4.10.3/example/solr 是solr home

④cp /solr-4.10.3/example/lib/ext/*  usr/local/solr/tomcat/webapps/solr/WEB-INF/lib/

⑤cp -r  /solr-4.10.3/example/solr  usr/local/solr/tomcat/

⑥solr 和solrhome建立联系:修改solr的web.xml

​	

```
<env-entry>
       <env-entry-name>solr/home</env-entry-name>
       <env-entry-value>/usr/local/solr/solrhome</env-entry-value>
       <env-entry-type>java.lang.String</env-entry-type>
    </env-entry>
```

