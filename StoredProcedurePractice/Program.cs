using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoredProcedurePractice
{
    class Program
    {
        static void Main(string[] args)
        {
            using (SqlConnection connection = new SqlConnection(@"Data Source=LAPTOP-B710EAPP;Initial Catalog=Customer;Integrated Security=True"))
            {
                try
                {
                    //Create the SqlCommand object
                    SqlCommand comm = new SqlCommand("spAddEmployeeToTables", connection);
                    //Specify that the SqlCommand is a stored procedure
                    comm.CommandType = System.Data.CommandType.StoredProcedure;
                    Console.WriteLine("Enter the name");
                    string @Name=Console.ReadLine();
                    comm.Parameters.AddWithValue("@Name", @Name);
                    Console.WriteLine("Enter the Email");
                    string @Email = Console.ReadLine();
                    comm.Parameters.AddWithValue("@EmailId", @Email);
                    Console.WriteLine("Enter the salary");
                    int @Salary =int.Parse(Console.ReadLine());
                    comm.Parameters.AddWithValue("@Salary", @Salary);

                    Console.WriteLine("Enter the genderId");
                    int @GenderId = int.Parse(Console.ReadLine());
                    comm.Parameters.AddWithValue("@GenderId", @GenderId);
                    Console.WriteLine("Enter the age");
                    int @Age =int.Parse(Console.ReadLine());
                    comm.Parameters.AddWithValue("@Age", @Age);

                    //Add the output parameter to the command object
                    SqlParameter outPutParameter = new SqlParameter();
                    outPutParameter.ParameterName = "@EmployeeId";
                    outPutParameter.SqlDbType = System.Data.SqlDbType.Int;
                    outPutParameter.Direction = System.Data.ParameterDirection.Output;
                    comm.Parameters.Add(outPutParameter);

                    connection.Open();
                    comm.ExecuteNonQuery();
                    string Id = outPutParameter.Value.ToString();
                    Console.WriteLine("Last column added Id is {0}",Id);
                    string sqlQuery = "select * from tblEmployee";
                    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlQuery, connection);
                    DataSet set = new DataSet();
                    sqlDataAdapter.Fill(set);
                    //To get all the data from tables in database
                    Console.WriteLine(set.GetXml());
                }
                catch(Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            }
        }
    }
}
