
import org.mindrot.jbcrypt.BCrypt;
//import junit.framework.TestCase;

public class Teste {

    public Teste(String password){
	// Hash a password for the first time
	String hashed = BCrypt.hashpw(password, BCrypt.gensalt());

	// gensalt's log_rounds parameter determines the complexity
	// the work factor is 2**log_rounds, and the default is 10
	//String hashed = BCrypt.hashpw(password, BCrypt.gensalt(12));

	// Check that an unencrypted password matches one that has
	// previously been hashed
	String candidate="123456";
	if (BCrypt.checkpw(candidate, hashed))
		System.out.println("It matches");
	else
		System.out.println("It does not match");
    }
    
    public static void main (String [] args){
	new Teste("123456");
    }

}
