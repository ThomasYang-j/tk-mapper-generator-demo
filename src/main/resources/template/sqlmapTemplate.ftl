<#assign entityClass=tableClass.packageName+".entity."+tableClass.shortClassName+"Entity">
<#assign mapperClass=tableClass.shortClassName+"Mapper">
<#assign sysFields=["id","deleted"]>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- 生成文件不允许修改-->
<mapper namespace="${tableClass.packageName}.mapper.${mapperClass}">
    <resultMap id="BaseResultMap" type="${entityClass}">
        <#list tableClass.allFields as field>
        <#if (field.columnName)?lower_case=="id">
        <id column="id" property="id" jdbcType="CHAR"/>
        <#else>
        <result column="${field.columnName}" property="${field.fieldName}"/>
        </#if>
        </#list>
    </resultMap>

    <sql id="Base_Column_List">
        <trim prefixOverrides="," suffixOverrides=",">
            <#list tableClass.allFields as field>
            ${field.columnName},
            </#list>
        </trim>
    </sql>

    <insert id="insertBatch" parameterType="java.util.List">
        INSERT INTO ${tableClass.tableName}(
        <include refid="Base_Column_List"/>
        )
        VALUES
        <foreach collection="list" item="entityI" separator=",">
            (
            <trim prefixOverrides="," suffixOverrides=",">
            <#list tableClass.allFields as field>
                ${r"#{entityI."+field.fieldName+"}"},
            </#list>
            </trim>
            )
        </foreach>
    </insert>

    <select id="getNewId" resultType="Long" parameterType="long">
        select func_seq_factory('table_${tableClass.tableName}',${r'#{_parameter}'})
    </select>

</mapper>