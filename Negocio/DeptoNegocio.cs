using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class DeptoNegocio:UnidadFuncionalNegocio
    {
        public List<Depto> ListarDepto()
        {
            try
            {
                List<Depto> lista = new List<Depto>();
                AccesoDatos datos = new AccesoDatos();
                //datos.setearQuery("select ID,numero,torre, piso from Unidad_Funcional");
                datos.setearQuery("select ID,numero, torre, piso,impagas,saldo from vw_GeneralUF");
                datos.ejecutarReader();
                while (datos.reader.Read())
                {
                    //Depto aux = new Depto(Convert.ToInt32(datos.reader[0]), Convert.ToInt32(datos.reader[1]), Convert.ToInt32(datos.reader[2]), Convert.ToInt32(datos.reader[3]));
                    Depto aux = new Depto(Convert.ToInt32(datos.reader[0]), Convert.ToInt32(datos.reader[1]), Convert.ToInt32(datos.reader[2]), Convert.ToInt32(datos.reader[3]),Convert.ToInt32(datos.reader[4]), Convert.ToDecimal(datos.reader[5]));

                    lista.Add(aux);
                }

                datos.cerrarConexion();
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
            
        }

        public Depto BuscarxUsuario(Int64 ID)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                Depto aux = new Depto();
                //datos.setearQuery("select ID, numero, torre, piso from Unidad_Funcional as uf inner join Usuarios_x_UnidadFuncional as uxu on uxu.IDUF=uf.ID where uxu.IDUsuario=@ID");
                datos.setearQuery("select ID, numero, torre, piso,Impagas,Saldo from vw_GeneralUF as uf inner join Usuarios_x_UnidadFuncional as uxu on uxu.IDUF=uf.ID where uxu.IDUsuario=@ID");
                datos.agregarParametro("@ID",ID);
                datos.ejecutarReader();
                datos.reader.Read();
                aux = new Depto(Convert.ToInt32(datos.reader[0]), Convert.ToInt32(datos.reader[1]), Convert.ToInt32(datos.reader[2]), Convert.ToInt32(datos.reader[3]), Convert.ToInt32(datos.reader[4]), Convert.ToDecimal(datos.reader[5]));
                //aux = new Depto(Convert.ToInt64(datos.reader[0]), Convert.ToInt32(datos.reader[1]), Convert.ToInt32(datos.reader[2]), Convert.ToInt32(datos.reader[3]));
                datos.cerrarConexion();
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        //public void Guardar(Inquilino inquilino)
        //{
        //    try
        //    {
        //        AccesoDatos datos = new AccesoDatos();
        //        Depto aux = new Depto();

        //        datos.setearSP("sp_AltaDepto");
        //        datos.agregarParametro("@TORRE", inquilino.departamento.torre);
        //        datos.agregarParametro("@PISO", inquilino.departamento.piso);
        //        datos.agregarParametro("@NUMERO", inquilino.departamento.numero);
        //        datos.agregarParametro("@DNI", inquilino.DNI);
        //        datos.ejecutarAccion();
        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }


        //}
        public void Guardar(Depto depto)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                Depto aux = new Depto();

                datos.setearSP("sp_AltaDepto");
                datos.agregarParametro("@TORRE", depto.torre);
                datos.agregarParametro("@PISO", depto.piso);
                datos.agregarParametro("@NUMERO", depto.numero);
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
        public void Eliminar(Depto depto)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                Depto aux = new Depto();

                datos.setearSP("sp_BajaDepto");
                datos.agregarParametro("@TORRE", depto.torre);
                datos.agregarParametro("@PISO", depto.piso);
                datos.agregarParametro("@NUMERO", depto.numero);
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
        public Depto BuscarxID(Int64 ID)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                Depto aux = new Depto();
                //datos.setearQuery("select ID, numero, torre, piso from Unidad_Funcional as uf inner join Usuarios_x_UnidadFuncional as uxu on uxu.IDUF=uf.ID where uf.ID=@IDUF");
                datos.setearQuery("select ID, numero, torre, piso,impagas,saldo from vw_GeneralUF as uf inner join Usuarios_x_UnidadFuncional as uxu on uxu.IDUF=uf.ID where uf.ID=@IDUF");
                datos.agregarParametro("@IDUF", ID);
                datos.ejecutarReader();
                if (!datos.reader.Read())
                {
                    aux = new Depto();
                    datos.cerrarConexion();
                    return aux;
                }
                aux = new Depto(Convert.ToInt32(datos.reader[0]), Convert.ToInt32(datos.reader[1]), Convert.ToInt32(datos.reader[2]), Convert.ToInt32(datos.reader[3]), Convert.ToInt32(datos.reader[4]), Convert.ToDecimal(datos.reader[5])); datos.cerrarConexion();
                datos.cerrarConexion();
                return aux;
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

    }
}
