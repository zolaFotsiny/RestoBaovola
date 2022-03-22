package DB;


import java.util.*;
import java.sql.*;
import java.lang.reflect.Method;
import java.lang.reflect.Field;

public class BDTable {
    Connection con;
	
 public Connection connecter() throws Exception
    {
        try{  
             Class.forName("org.postgresql.Driver");
             return con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/resto","postgres","1234");    
            }
        catch(ClassNotFoundException | SQLException e){ 
        return null;
        } 	
    }
    
    public String functGet (String attr){
        StringBuilder ns=new StringBuilder(attr);
        ns.setCharAt(0,Character.toUpperCase(attr.charAt(0)));
        String namef="get"+ns.toString();
        return namef;
    }

    public Object valFie(Field f) throws Exception{
        Method[] fn=this.getClass().getDeclaredMethods();
        Object val=null;
        for (Method fn1 : fn) {
            if (fn1.getName().equals(functGet(f.getName())) == true) {
                val = fn1.invoke(this);
            }
        }
        return val;
    }

    public int countNotNull() throws Exception{
        int isa=0;
        Field[] attr=this.getClass().getDeclaredFields();
        for (Field attr1 : attr) {
            if ((attr1.getType().getName().equals("double") == false && attr1.getType().getName().equals("int") == false && valFie(attr1) != null) || (attr1.getType().getName().equals("double") == true && ((Double) valFie(attr1)) != 0) || (attr1.getType().getName().equals("int") == true && ((Integer) valFie(attr1)) != 0)) {
                isa++;
            }
        }
        return isa;
    }

    public int countGet() throws Exception{
        int isa=0;
        Method[] fn=this.getClass().getDeclaredMethods();
        for (Method fn1 : fn) {
            if (fn1.getName().startsWith("get") == true) {
                isa++;
            }
        }
        return isa;
    }

    public Method[] methNotNull() throws Exception{
        Method[] val=new Method[countNotNull()];
        Method[] fn=this.getClass().getDeclaredMethods();
        int ind=0;
        for (Method fn1 : fn) {
            if (fn1.getName().startsWith("get") == true && fn1.invoke(this) != null) {
                val[ind] = fn1;
                ind++;
            }
        }
        return val;
    }

    public Method[] methGet() throws Exception{
        Method[] val=new Method[countGet()];
        Method[] fn=this.getClass().getDeclaredMethods();
        int ind=0;
        for (Method fn1 : fn) {
            if (fn1.getName().startsWith("get") == true) {
                val[ind] = fn1;
                ind++;
            }
        }
        return val;
    }
    
    public Field[] fieldNotNull() throws Exception
    {
        Field[] attr=this.getClass().getDeclaredFields();
        Field[] val=new Field[countNotNull()];
        int ind=0;
        for (Field attr1 : attr) {
            if ((attr1.getType().getName().equals("double") == false && attr1.getType().getName().equals("int") == false && valFie(attr1) != null) || (attr1.getType().getName().equals("double") == true && ((Double) valFie(attr1)) != 0) || (attr1.getType().getName().equals("int") == true && ((Integer) valFie(attr1)) != 0)) {
                val[ind] = attr1;
                ind++;
            }
        }
        return val;
    }

    public Method methId() throws Exception
    {
        Method[] lm=this.getClass().getDeclaredMethods();
        Method val=lm[0];
        for (Method lm1 : lm) {
            if (lm1.getName().equals("getId") == true) {
                val = lm1;
            }
        }
        return val;
    }

    public Method methConstr() throws Exception
    {
        Method[] lm=this.getClass().getDeclaredMethods();
        Method val=lm[0];
        for (Method lm1 : lm) {
            if (lm1.getName().equals("construct") == true) {
                val = lm1;
            }
        }
        return val;
    }

    public Field fieldId() throws Exception
    {
        Field[] lm=this.getClass().getDeclaredFields();
        Field val=lm[0];
        for (Field lm1 : lm) {
            if (lm1.getName().equals("id") == true) {
                val = lm1;
            }
        }
        return val;
    }

    public Integer claId() throws Exception
    {
        Integer val=((Integer)methId().invoke(this));
        return val;
    }
  
    
    
    public String[] nameField()
	{
		Class classe=this.getClass();
		Field[] attr=classe.getDeclaredFields();
		String[] attribut=new String[attr.length];
		for(int i=0;i<attr.length;i++)
		{
			attribut[i]=attr[i].getName();
		}
		return attribut;
	}
	
    
	public static String toUpperFirst(String a) 
	{
                String retour;
		char[] t=a.toCharArray();
		t[0]=Character.toUpperCase(t[0]);
		retour=new String(t);
		return retour;
        }
	//concatener avec un get
	public String concatGet(String a)
	{
		String retour=toUpperFirst(a) ;
		retour="get"+retour;
		return retour;
	}
    public String[] getter()///namefields to nameFields+get
	{
		String[] attribut=this.nameField();
		for(int i=0;i<attribut.length;i++)
		{
			attribut[i]=this.concatGet(attribut[i]);
		}
		return attribut;
	}
	
    
    public Method[] getMethod() throws Exception ///maka anle methode get;
	{
		Class classe=this.getClass();
		String[] attribut=getter();
                
		Method[] listeMethod=new Method[attribut.length];
		for(int i=0;i<attribut.length;i++)
		{
			listeMethod[i]=classe.getMethod(attribut[i]);
		}
		return listeMethod;
	}
    public Object[] getMethodValues() throws Exception ///maka anle valeur methode get
	{
		Method[] listeMethod=this.getMethod();
		Object[] vali=new Object[listeMethod.length];
		for(int i=0;i<listeMethod.length;i++)
		{
			vali[i]=listeMethod[i].invoke(this);
			// System.out.println(vali[i]);
		}
	return vali;
	}
    public int nonnull(Object[] liste)
	{
		int valiny=0;
        for (Object liste1 : liste) {
            if (liste1 != null) {
                valiny++;
            }
        }
		return valiny;
	}
  
    
    
        
    
///////////////////////////////////rETO IHANY NO AMPIASAINA    
    
    
    
    
    public List find(String req,Object o) throws Exception {
        Connection c=null;
        Statement stmt = null;
        ResultSet res = null;
        ResultSet res2 =null;
        List list = new ArrayList<>();
        try{
            c=this.connecter();
            int nb = 0,indice = 0,id = 1;
            stmt=c.createStatement();
            res=stmt.executeQuery(req);
            while(res.next()) {
                    nb++;
            }
            Field[] fields = this.getClass().getDeclaredFields();
            Method[] method = new Method[fields.length];
            res2 = stmt.executeQuery(req);
            while(res2.next()) {
                    Object retour =o.getClass().newInstance();
                    for(int i=0;i<method.length;i++) {
                        Class[] classe = new Class[1];
                        classe[0] = fields[i].getType();
                        if(classe[0].getSimpleName().equals("Integer")||classe[0].getSimpleName().equals("int")||classe[0].getSimpleName().equals("serial"))   retour.getClass().getMethod("set"+toUpperFirst(fields[i].getName()),classe).invoke(retour, res2.getInt(id));
                        if(classe[0].getSimpleName().equals("Double")||classe[0].getSimpleName().equals("double")) retour.getClass().getMethod("set"+toUpperFirst(fields[i].getName()),classe).invoke(retour, res2.getDouble(id));
                        if(classe[0].getSimpleName().equals("String")) retour.getClass().getMethod("set"+toUpperFirst(fields[i].getName()),classe).invoke(retour, res2.getString(id));
                        if(classe[0].getSimpleName().equals("Date")) retour.getClass().getMethod("set"+toUpperFirst(fields[i].getName()),classe).invoke(retour, res2.getDate(id));
                        id++;
                    }
                    id=1;
                    indice++;
                    list.add(retour);
            }
             return list;
        }
        catch(SQLException e){	
                e.getMessage();
                return null;
        }
        finally{
                if(stmt != null) stmt.close();
                if(c != null) c.close();
                if(res != null) res.close();
                if(res2 != null) res2.close();
        }
    }
    public void execute (String req) throws Exception
    {
       Connection con = null;
		PreparedStatement stmt = null;
		  
		try{
			con = this.connecter();
			stmt=con.prepareStatement(req);
			stmt.executeUpdate();
		}
		catch(SQLException e){	
			e.getMessage();
			System.out.println(e);
		}
		finally{
				if(stmt != null) stmt.close();
				if(con != null) con.close();
		}
    }
    
    public String selectString (String req) throws Exception
	{
		Connection c = null;
		String a="";
		try{
			c=this.connecter();
			PreparedStatement ps=c.prepareStatement(req);
			ResultSet res=ps.executeQuery();
			 while (res.next()) {
				a=res.getString(1);
			}
			return a;
		}
		catch(Exception ex){
			throw ex;
		}
		finally{
			c.close();
		}
	}
    
   
	
 
}
