# solr 配置：

①复制/solr-4.10.3/dist/solr-4.10.3.war到usr/local/solr/tomcat/webapps/

②solrj是solr的客户端

③ /solr-4.10.3/example/solr 是solr home

④

```
cp /solr-4.10.3/example/lib/ext/*  usr/local/solr/tomcat/webapps/solr/WEB-INF/lib/
```

⑤

```
cp -r  /solr-4.10.3/example/solr  usr/local/solr/tomcat/
```

⑥solr 和solrhome建立联系:修改solr的web.xml

​	

```
<env-entry>
       <env-entry-name>solr/home</env-entry-name>
       <env-entry-value>/usr/local/solr/solrhome</env-entry-value>
       <env-entry-type>java.lang.String</env-entry-type>
    </env-entry>
```

## 添加业务域: 

### 	使用中文分析器:

```
cp IKAnalyzer2012FF_u1.jar /usr/local/solr/tomcat/webapps/solr/WEB-INF/lib/	
```

​	

```
cp IKAnalyzer.cfg.xml ext_stopword.dic mydict.dic /usr/local/solr/tomcat/webapps/solr/WEB-INF/classes/

```

### 	定义filedType:

```
/usr/local/solr/solrhome/collection1/conf/schema.xml
```

​	只有textFiled才能指定分析器,既分词又实现索引

​	string 不分词但实现索引：身份证号，订单号，分类名称

​	keyword 一般为复制域，