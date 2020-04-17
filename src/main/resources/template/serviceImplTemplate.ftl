<#assign entity=tableClass.shortClassName+"Entity">
<#assign entityL=entity?uncap_first>
<#assign service=tableClass.shortClassName+"Service">
<#assign serviceL=service?uncap_first>
<#assign mapper=tableClass.shortClassName+"Mapper">
<#assign mapperL=mapper?uncap_first>
package ${tableClass.packageName}.service.impl;

import ${tableClass.packageName}.entity.${tableClass.shortClassName}Entity;
import ${tableClass.packageName}.mapper.${tableClass.shortClassName}Mapper;
import ${tableClass.packageName}.service.${tableClass.shortClassName}Service;
import com.cnjiang.common.mybatis.AbstractService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;
import java.util.List;

/**
 * @author cnjiang
 */
@Slf4j
@Service
public class ${service}Impl extends AbstractService<${entity}> implements ${service} {

    @Autowired
    private ${mapper} ${mapperL};

    @Override
    public Integer insert(${entity} ${entityL}) {
        if (StringUtils.isEmpty(${entityL}.getId()))
            ${entityL}.setId(${mapperL}.makeKey());
        return ${mapperL}.insertSelective(${entityL});
    }

    @Override
    public PageInfo<${entity}> list(${entity} ${entityL}, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize, "create_time desc");
        List<${entity}> ${tableClass.shortClassName?uncap_first}List = ${mapperL}.select(${entityL});
        return new PageInfo<>(${tableClass.shortClassName?uncap_first}List);
    }

    @Override
    public ${entity} view(String id) {
        if (StringUtils.isEmpty(id))
            return null;
        else
            return ${mapperL}.selectByPrimaryKey(id);
    }

    @Override
    public Integer update(${entity} ${entityL}) {
        return ${mapperL}.updateByPrimaryKeySelective(${entityL});
    }

    @Override
    public Integer remove(String id) {
        return ${mapperL}.deleteByPrimaryKey(id);
    }
}
