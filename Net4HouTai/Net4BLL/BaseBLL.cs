using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EDAL;
using EModel;
using System.Linq.Expressions;
namespace EBLL
{
    /// <summary>
    /// 定义一个泛型类。
    /// where T : class---》限制T必须是引用类型。
    /// </summary>
    /// <typeparam name="T"></typeparam>
    ///

    public class BaseBLL<T> where T : class
    {
        /// <summary>
        /// 查询所有。
        /// </summary>
        /// <returns></returns>
        /// 
        private BaseDAL<T> dal;

        public BaseBLL(BaseDAL<T> dal)
        {
            this.dal = dal;
        }






        public virtual List<T> GetAll()
        {

            return dal.GetAll();
        }
        /// <summary>
        /// 根据主键找实体。
        /// </summary>
        /// <param name="pk"></param>
        /// <returns></returns>
        public virtual T GetByPK(object pk)
        {
            return dal.GetByPK(pk);
        }
        /// <summary>
        /// 新增。
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public virtual bool Add(T info)
        {
            using (ElmEntities db = new ElmEntities())
            {
                return dal.Add(info);
            }
        }
        /// <summary>
        /// 修改。
        /// </summary>
        /// <param name="info"></param>
        /// <returns></returns>
        public virtual bool Update(T info)
        {
            using (ElmEntities db = new ElmEntities())
            {
                //附件一个实体类。
                return  dal.Update(info);
            }
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="pk"></param>
        /// <returns></returns>  
        public virtual bool Delete(object pk)
        {
            ElmEntities db = new ElmEntities();
            var info = db.Set<T>().Find(pk);
            if (info != null)
            {
                return dal.Delete(pk);
            }
            else
            {

                return false;
            }
        }
        //多条件查询
        public virtual List<T> Duocha(Expression<Func<T, bool>> tj)
        {
            return dal.duocha(tj);
        }
    }
}
