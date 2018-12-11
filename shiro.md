### shiro

![](/home/zyl/gitee/work/imooc-shiro/src/main/resources/static/image/shiro架构.png)

Authenticator:认证器

Authorizer:授权器

session manager :session管理机制

session dao ：session增删改查

realms :shiro和数据源之间的桥梁

#### 1.shiro认证

![](/home/zyl/gitee/work/imooc-shiro/src/main/resources/static/image/shiro认证.png)





#### 1.1依赖

```
 <dependencies>
        <!-- https://mvnrepository.com/artifact/org.apache.shiro/shiro-core -->
        <dependency>
            <groupId>org.apache.shiro</groupId>
            <artifactId>shiro-core</artifactId>
            <version>1.4.0</version>
        </dependency>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
        </dependency>

    </dependencies>
```

#### 1.2认证测试

```
public class AuthenticatorTest {

    SimpleAccountRealm accountRealm = new SimpleAccountRealm();

    @Before
    public void addUser(){
        accountRealm.addAccount("zyl","123");
    }
    @Test
    public void testAuthenticator(){
        //1.构建SecurityManager 环境
        //1.1 创建认证器
        DefaultSecurityManager manager = new DefaultSecurityManager();
        //1.2 为认证器设置realm
        manager.setRealm(accountRealm);

        //2.主体提交认证请求
        SecurityUtils.setSecurityManager(manager);
        Subject subject = SecurityUtils.getSubject();
        //3提交token
        UsernamePasswordToken token = new UsernamePasswordToken("zyl","123");
        subject.login(token);
        System.out.println("isAuthenticated:"+ subject.isAuthenticated());
        subject.logout();
        System.out.println("isAuthenticated:"+ subject.isAuthenticated());
    }
}
```

### 2.授权

![](src/main/resources/static/image/shiro授权.png)



```
package com.imooc;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.realm.SimpleAccountRealm;
import org.apache.shiro.subject.Subject;
import org.junit.Before;
import org.junit.Test;

public class AuthenticatorTest {

    SimpleAccountRealm accountRealm = new SimpleAccountRealm();

    @Before
    public void addUser(){
        accountRealm.addAccount("zyl","123","admin","user");
    }
    @Test
    public void testAuthenticator(){
        //1.构建SecurityManager 环境
        //1.1 创建认证器
        DefaultSecurityManager manager = new DefaultSecurityManager();
        //1.2 为认证器设置realm
        manager.setRealm(accountRealm);

        //2.主体提交认证请求
        SecurityUtils.setSecurityManager(manager);
        Subject subject = SecurityUtils.getSubject();
        //3提交token
        UsernamePasswordToken token = new UsernamePasswordToken("zyl","123");
        subject.login(token);
        System.out.println("isAuthenticated:"+ subject.isAuthenticated());
//        subject.logout();
//        System.out.println("isAuthenticated:"+ subject.isAuthenticated());
        subject.checkRoles("admin","user");

    }
}
```

