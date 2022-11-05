import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SocialLinkButton(
              title: '@ajai_fisayo',
              icon: FontAwesomeIcons.twitter,
              link: 'https://www.twitter.com/ajai_fisayo',
              iconColor: Colors.blue),
          SocialLinkButton(
            title: '@cyph33r',
            icon: FontAwesomeIcons.github,
            link: 'https://www.github.com/cyph33r',
          ),
          SocialLinkButton(
            title: 'https://www.linkedin.com/in/olufisayo-ajai-a014271aa/',
            icon: FontAwesomeIcons.linkedin,
            link: 'https://www.linkedin.com/in/olufisayo-ajai-a014271aa/',
            iconColor: Colors.blue,
          ),
          SocialLinkButton(
            title: 'tadeajai4@gmail.com',
            icon: FontAwesomeIcons.envelope,
            link: 'mailto:tadeajai4@gmail.com',
            iconColor: Colors.blue,
          ),
          SocialLinkButton(
            title: '@d__coder',
            icon: FontAwesomeIcons.instagram,
            link: 'https://www.instagram.com/d____coder',
            iconColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}

class SocialLinkButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;
  final String link;

  const SocialLinkButton({
    required this.title,
    required this.icon,
    required this.link,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(link)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: iconColor,
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            child: Text(
              title,
              style: GoogleFonts.roboto(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
