<#assign entity=tableClass.shortClassName+"Entity">
<#assign entityL=entity?uncap_first>
<#assign service=tableClass.shortClassName+"Service">
package ${tableClass.packageName}.service;

import ${tableClass.packageName}.entity.${entity};
import com.cnjiang.common.mybatis.BaseService;
import com.github.pagehelper.PageInfo;

/**
 * @author EALING
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
