<#assign entity=table.className+"Entity">
<#assign sysFields=["id","deleted","createTime","modifyTime","createById","modifyById"]>
package ${table.pag}.entity;
import java.math.BigDecimal;
import com.cnjiang.common.mybatis.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/**
 * @author cnjiang
 */
@Data
@Table(name = "${table.tableName}")
public class ${entity} extends BaseEntity implements Serializable {

    private static final long serialVersionUID = ${table.uid}L;

<#list table.fields as index>
    <#if sysFields?seq_index_of(index.property) = -1>
    @ApiModelProperty("${index.remark?html}")
    private ${index.propertyType} ${index.property};
    </#if>
</#list>
}
