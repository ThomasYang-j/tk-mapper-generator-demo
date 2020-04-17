<#assign entity=table.className+"Entity">
<#assign entityL=entity?uncap_first>
<#assign service=table.className+"Service">
<#assign serviceL=service?uncap_first>
<#assign mapper=table.className+"Mapper">
<#assign mapperL=mapper?uncap_first>
package ${table.pag}.service.impl;

import ${table.pag}.entity.${table.className}Entity;
import ${table.pag}.mapper.${table.className}Mapper;
import ${table.pag}.service.${table.className}Service;
import com.cnjiang.common.mybatis.AbstractService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cnjiang.common.utils.TxtUtil;
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
        if (TxtUtil.isEmpty(${entityL}.getId()))
            ${entityL}.setId(${mapperL}.makeKey());
        return ${mapperL}.insertSelective(${entityL});
    }

    @Override
    public PageInfo<${entity}> list(${entity} ${entityL}, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize, "create_time desc");
        List<${entity}> ${table.className?uncap_first}List = ${mapperL}.select(${entityL});
        return new PageInfo<>(${table.className?uncap_first}List);
    }

    @Override
    public ${entity} view(String id) {
        if (TxtUtil.isEmpty(id))
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
