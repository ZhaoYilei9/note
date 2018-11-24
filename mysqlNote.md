## mysql

### 设置权限

GRANT ALL PRIVILEGES ON *.* TO ['root'@'%'] IDENTIFIED BY '123' WITH GRANT OPTION; flush privileges; 

### 设置密码 

SET PASSWORD FOR ['root'@'localhost'](mailto:'root'@'localhost') = PASSWORD('1234'); 

###  模糊查询

```
/**
 *
 * @param videoDesc 一个很恶心的问题模糊查询
 *                  '%${videoDesc}%'不能写成'%#{videoDesc}%'
 * @return
 */
@Select("<script>select v.*,u.face_image as faceImage,u.nickname as nickname " +
        "from videos v left join users u on v.user_id = u.id " +
        "where 1 = 1 " +
        "<if test=\" videoDesc != null and videoDesc != '' \">" +
        "and v.video_desc like '%${videoDesc}%'" +
        "</if>" +
        "</script>")
List<VideosVo> showAll(@Param("videoDesc") String videoDesc);
```