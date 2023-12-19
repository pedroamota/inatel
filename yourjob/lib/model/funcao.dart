import 'package:url_launcher/url_launcher.dart';

class Funcoes {
  Future<bool> sendMessage(String phone) async {
    var whatsappUrl =
        "whatsapp://send?phone=55$phone&text=Olá, tudo bem? Vim do app YourJob e gostaria de contratar seus serviços.";

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
      return true;
    } else {
      return false;
    }
  }
}
