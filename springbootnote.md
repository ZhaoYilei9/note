## springboot

### mybatis:

```
@Update("UPDATE t_user SET userName = #{user.userName},password = #{user.password},phone = #{user.phone} where userId = #{user.userId}")
int update(@Param("user") User user);
```

### ####注意：#{user.userName}外不能加引号

