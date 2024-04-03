package Validacion;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidarPartes {

	public static boolean validarNif(String Nif) {
		final String Nif_Regex = ("^\\d{8}[TRWAGMYFPDXBNJZSQVHLCKE]$");
		final Pattern patternNIF = Pattern.compile(Nif_Regex);

		Matcher matcher = patternNIF.matcher(Nif);
		return matcher.matches();
	}

	public static boolean validarEmail(String email) {
		final String EMAIL_REGEX = "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}\\b";
		final Pattern pattern = Pattern.compile(EMAIL_REGEX);

		Matcher matcher = pattern.matcher(email);
		return matcher.matches();
	}

	public static boolean validarTelefono(String tfno) {
		final String TELEFONO_Regex = "^(\\+34|0034|34)?[89]\\d{8}$";
		Pattern pattern = Pattern.compile(TELEFONO_Regex);

		Matcher matcher = pattern.matcher(tfno);
		return matcher.matches();
	}

	public static boolean validarCodigoOperario(String codigoOperario) {
		Pattern pattern = Pattern.compile("OP\\d{4}");
		Matcher matcher = pattern.matcher(codigoOperario);
		return matcher.matches();
	}

	// Depurar los metodos

	public static void main(String[] args) {
		String nif = "44222333E";
		String correo = "correo@gmail.com";
		String telefono = "+34678901234";
		String codigoOp = "OP3333";
		boolean esValido = validarNif(nif);
		boolean esValido2 = validarEmail(correo);
		boolean esValido3 = validarTelefono(telefono);
		boolean esValido4 = validarCodigoOperario(codigoOp);

		if (esValido) {

			System.out.println("El NIF " + nif + " es válido soy la castaña.");

		} else {
			System.out.println("El NIF " + nif + " no es válido.");
			System.out.println("El correo " + correo + "no es  válido .");
		}

		if (esValido2) {

			System.out.println("El NIF " + correo + " es válido soy la castaña.");

		} else {
			System.out.println("El NIF " + correo + " no es válido.");

		}

		if (esValido3) {

			System.out.println("El telefono " + telefono + " es válido soy la castaña.");

		} else {
			System.out.println("El telefono " + telefono + " no es válido.");

		}

		if (esValido4) {

			System.out.println("El codigoOP " + codigoOp + " es válido soy la castaña.");

		} else {

			System.out.println("El codigoOP " + codigoOp + "no es  válido .");
		}

	}

}
