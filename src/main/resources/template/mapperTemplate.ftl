<#assign entity=tableClass.shortClassName+"Entity">
package ${tableClass.packageName}.mapper;

import ${tableClass.packageName}.entity.${entity};
import com.cnjiang.common.mybatis.MapperUtil;
import org.springframework.stereotype.Component;

/**
 * @author cnjiang
 */
@Component
public interface ${tableClass.shortClassName}Mapper extends MapperUtil<${entity}> {
}
