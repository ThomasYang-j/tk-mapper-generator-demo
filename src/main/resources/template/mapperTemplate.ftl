<#assign entity=table.className+"Entity">
package ${table.pag}.mapper;

import ${table.pag}.entity.${entity};
import com.cnjiang.common.mybatis.MapperUtil;
import org.springframework.stereotype.Component;

/**
 * @author cnjiang
 */
@Component
public interface ${table.className}Mapper extends MapperUtil<${entity}> {
}
