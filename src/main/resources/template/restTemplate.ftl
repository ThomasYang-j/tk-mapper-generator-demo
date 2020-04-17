<#assign entity=tableClass.shortClassName+"Entity">
<#assign entityL=entity?uncap_first>
<#assign service=tableClass.shortClassName+"Service">
<#assign sysFields=["id","deleted","createTime","modifyTime","createById","modifyById"]>
package ${tableClass.packageName}.api;

import ${tableClass.packageName}.entity.${entity};
import ${tableClass.packageName}.service.${service};
import com.cnjiang.common.enums.MessageEnum;
import com.cnjiang.common.utils.JsonResultEntity;
import com.cnjiang.common.utils.JsonResultUtil;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author EALING
 */
@RestController
@RequestMapping("/rest/admin/${tableClass.shortClassName}")
@Api(tags = "${((table.remark)!"")?replace("\r\n", "")}")
@Slf4j
public class ${tableClass.shortClassName}RestController {

    @Autowired
    private ${service} ${service?uncap_first};

    @ApiOperation(value = "新增", notes = "新增")
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    @ApiImplicitParams({
    <#list tableClass.allFields as index>
        <#if sysFields?seq_index_of(index.fieldName) = -1>
            @ApiImplicitParam(name = "${index.fieldName}", value = "${index.remarks?html}", required = ${index.nullable?string("true","false")}, dataType = "${index.shortTypeName}", paramType = "query"),
        </#if>
    </#list>
    })
    public ResponseEntity<JsonResultEntity<?>> insert(${entity} ${entityL}) {
        Integer r = ${service?uncap_first}.insert(${entityL});
        if (r == 1) {
            return ResponseEntity.ok(JsonResultUtil.success());
        } else {
            return ResponseEntity.ok(JsonResultUtil.error());
        }
    }

    @ApiOperation(value = "列表", notes = "列表信息")
    @RequestMapping(value = "list", method = RequestMethod.POST)
    @ApiImplicitParams({
    <#list tableClass.allFields as index>
        <#if sysFields?seq_index_of(index.fieldName) = -1>
            @ApiImplicitParam(name = "${index.fieldName}", value = "${index.remarks?html}", required = ${index.nullable?string("true","false")}, dataType = "${index.shortTypeName}", paramType = "query"),
        </#if>
    </#list>
            @ApiImplicitParam(name = "pageNum", value = "页码", required = true, dataType = "Integer", paramType = "query"),
            @ApiImplicitParam(name = "pageSize", value = "每页数据量", required = true, dataType = "Integer", paramType = "query")
    })
    public ResponseEntity<JsonResultEntity<PageInfo<${entity}>>> list(${entity} ${entityL}, Integer pageNum, Integer pageSize) {
        PageInfo<${entity}> pageInfo = ${service?uncap_first}.list(${entityL}, pageNum, pageSize);
        return ResponseEntity.ok(JsonResultUtil.success(pageInfo, MessageEnum.COMMON_STATUS_OK.getCode(), MessageEnum.COMMON_STATUS_OK.getMessage()));
    }

    @ApiOperation(value = "详情", notes = "详情信息")
    @RequestMapping(value = "view", method = RequestMethod.POST)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "ID", required = true, dataType = "Long", paramType = "query")
    })
    public ResponseEntity<JsonResultEntity<${entity}>> view(String id) {
        ${entity} ${entityL} = ${service?uncap_first}.view(id);
        return ResponseEntity.ok(JsonResultUtil.success(${entityL}, MessageEnum.COMMON_STATUS_OK.getCode(), MessageEnum.COMMON_STATUS_OK.getMessage()));
    }

    @ApiOperation(value = "修改", notes = "修改")
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ApiImplicitParams({
    <#list tableClass.allFields as index>
        <#if index.fieldName="id">
            @ApiImplicitParam(name = "${index.fieldName}", value = "${index.remarks?html}", required = ${index.nullable?string("true","false")}, dataType = "${index.shortTypeName}", paramType = "query"),
        <#elseif sysFields?seq_index_of(index.fieldName) = -1>
            @ApiImplicitParam(name = "${index.fieldName}", value = "${index.remarks?html}", required = ${index.nullable?string("true","false")}, dataType = "${index.shortTypeName}", paramType = "query"),
        </#if>
    </#list>
    })
    public ResponseEntity<JsonResultEntity<?>> update(${entity} ${entityL}) {
        Integer r = ${service?uncap_first}.update(${entityL});
        if (r == 1) {
            return ResponseEntity.ok(JsonResultUtil.success());
        } else {
            return ResponseEntity.ok(JsonResultUtil.error());
        }
    }

    @ApiOperation(value = "删除", notes = "删除")
    @RequestMapping(value = "remove", method = RequestMethod.POST)
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "ID", required = true, dataType = "String", paramType = "query")
    })
    public ResponseEntity<JsonResultEntity<?>> remove(String id) {
        Integer r = ${service?uncap_first}.remove(id);
        if (r == 1) {
            return ResponseEntity.ok(JsonResultUtil.success());
        } else {
            return ResponseEntity.ok(JsonResultUtil.error());
        }
    }
}
