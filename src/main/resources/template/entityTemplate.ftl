<#assign entity=tableClass.shortClassName+"Entity">
<#assign sysFields=["id","deleted","createTime","modifyTime","createById","modifyById"]>
package ${tableClass.packageName};
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
@Table(name = "${tableClass.tableName}")
public class ${entity} extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

<#list tableClass.allFields as index>
    <#if sysFields?seq_index_of(index.fieldName) = -1>
    @ApiModelProperty("${index.remarks?html}")
    private ${index.shortTypeName} ${index.fieldName};
    </#if>
</#list>
}
