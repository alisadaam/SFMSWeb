using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;

namespace SFMSWeb.BusinessLogic
{
    public static class BusinessExtensions
    {

		public static List<T> ConvertDataTableToList1<T>(DataTable dt)
		{
			return (from DataRow row in dt.Rows select GetItem1<T>(row)).ToList();
		}

		private static T GetItem1<T>(DataRow dr)
		{
			bool isDecimal = false;
			var temp = typeof(T);
			var obj = Activator.CreateInstance<T>();
			foreach (DataColumn column in dr.Table.Columns)
			{
				if(column.DataType==typeof(decimal))
				{
					isDecimal = true;
				}

				foreach (var pro in temp.GetProperties())
				{
					if (pro.Name == column.ColumnName)
					{

						if (dr[column.ColumnName] == DBNull.Value)
						{

							if (isDecimal)
								dr[column.ColumnName] = 0;
							else
							dr[column.ColumnName] = "";

						}
						
						pro.SetValue(obj, dr[column.ColumnName], null);
					}
					else
						continue;
				}
			}
			return obj;
		}
        public static List<T> ConvertDataTableToList<T>(DataTable dt)
		{
			return (from DataRow row in dt.Rows select GetItem<T>(row)).ToList();
		}

		private static T GetItem<T>(DataRow dr)
		{
			var temp = typeof(T);
			var obj = Activator.CreateInstance<T>();
			foreach (DataColumn column in dr.Table.Columns)
			{
				foreach (var pro in temp.GetProperties())
				{
					if (pro.Name == column.ColumnName)
					{
						if (dr[column.ColumnName]==DBNull.Value)
						{
							pro.SetValue(obj,"0");
						}
						else
						pro.SetValue(obj, dr[column.ColumnName], null);
					}
					else
						continue;
				}
			}
			return obj;
		}

        public static DataTable ConvertListToDataTable<T>(IList<T> data)// T is any generic type
        {
            PropertyDescriptorCollection props = TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            for (int i = 0; i < props.Count; i++)
            {
                PropertyDescriptor prop = props[i];
                table.Columns.Add(prop.Name, prop.PropertyType);
            }
            object[] values = new object[props.Count];
            foreach (T item in data)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    values[i] = props[i].GetValue(item);
                }
                table.Rows.Add(values);
            }
            return table;
        }
    }
}