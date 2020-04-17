<#assign entity=table.className+"Entity">
<#assign entityL=entity?uncap_first>
<#assign service=table.className+"Service">
package ${table.pag}.service;

import ${table.pag}.entity.${entity};
import com.cnjiang.common.mybatis.BaseService;
import com.github.pagehelper.PageInfo;

/**
 * @author cnjiang
 */
public interface ${service} extends BaseService<${entity}> {

    /**
     * 新增
     *
     * @param ${entityL}
     * @return
     */
    Integer insert(${entity} ${entity?uncap_first});

    /**
     * 列表
     *
     * @param ${entityL}
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<${entity}> list(${entity} ${entity?uncap_first}, Integer pageNum, Integer pageSize);

    /**
     * 详情
     *
     * @param id
     * @return
     */
    ${entity} view(String id);

    /**
     * 修改
     *
     * @param ${entityL}
     * @return
     */
    Integer update(${entity} ${entity?uncap_first});

    /**
     * 删除
     *
     * @param id
     * @return
     */
    Integer remove(String id);
}
