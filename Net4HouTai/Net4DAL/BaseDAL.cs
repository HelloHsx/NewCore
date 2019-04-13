using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;

namespace EDAL
{
    /// <summary>
    /// 定义一个泛型类。
    /// where T : class---》限制T必须是引用类型。
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class BaseDAL<T> where T : class
    {
    //    /// <summary>
    //    /// 查询所有。
    //    /// </summary>
    //    /// <returns></returns>
    //    public virtual List<T> GetAll()
    //    {
    //         ElmEntities db = new ElmEntities();
    //        //db.Set<TBL_USER>()--->DbSet<TBL_USER> 
    //        return db.Set<T>().ToList();
    //    }
    //    /// <summary>
    //    /// 根据主键找实体。
    //    /// </summary>
    //    /// <param name="pk"></param>
    //    /// <returns></returns>
    //    public virtual T GetByPK(object pk)
    //    {
    //        ElmEntities db = new ElmEntities();
    //        return db.Set<T>().Find(pk);
    //    }

    //    /// <summary>
    //    /// 多条件查询
    //    /// </summary>
    //    /// <param name="tj"></param>
    //    /// <returns></returns>
    //    public virtual List<T> duocha(Expression<Func<T, bool>> tj)
    //    {
    //        ElmEntities db = new ElmEntities();
    //        return db.Set<T>().Where(tj).ToList();
    //    }

    //    /// <summary>
    //    /// 新增。
    //    /// </summary>
    //    /// <param name="info"></param>
    //    /// <returns></returns>
    //    public virtual bool Add(T info)
    //    {
    //        //var qwe = info;
    //            ElmEntities db = new ElmEntities();
    //            //db.Configuration.ValidateOnSaveEnabled = false;
    //            db.Set<T>().Add(info);
    //            //db.Entry<T>(info).State = System.Data.EntityState.Added;
    //            return db.SaveChanges() > 0;  
    //    }
    //    /// <summary>
    //    /// 修改。
    //    /// </summary>
    //    /// <param name="info"></param>
    //    /// <returns></returns>
    //    public virtual bool Update(T info)
    //    {
    //        using (ElmEntities db = new ElmEntities())
    //        {
    //            //附件一个实体类。
    //            db.Entry<T>(info).State = System.Data.EntityState.Modified;
    //            return db.SaveChanges() > 0;
    //        }
    //    }

    //    /// <summary>
    //    /// 删除
    //    /// </summary>
    //    /// <param name="pk"></param>
    //    /// <returns></returns>
    //    public virtual bool Delete(object pk)
    //    {
    //        ElmEntities db = new ElmEntities();
    //        var info = db.Set<T>().Find(pk);
    //        if (info != null)
    //        {
    //            db.Set<T>().Remove(info);
    //            return db.SaveChanges() > 0;
    //        }
    //        else
    //        {
    //            return false;
    //        }
    //    }

    }
}
