//Derick felipe
package controles;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
//classe para realizar o metodo de conversão da data para o banco
public class DataUtils {
     public static Date converterStringParaData(String dataString) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        return formatter.parse(dataString);
}
}