import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'HelpCenterScreen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 23, color: Colors.blue),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Privacy Policy',style: TextStyle(color: Colors.white),),
              tileColor: Colors.blueGrey,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
                );

              },

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Terms and Conditions',style: TextStyle(color: Colors.white),),
              tileColor: Colors.blueGrey,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsConditionsScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Help Center',style: TextStyle(color: Colors.white),),
              tileColor: Colors.blueGrey,
              onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpCenterScreen()),
                  );


              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('About!',style: TextStyle(color: Colors.white),),
              tileColor: Colors.blueGrey,
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => about()),
                );


              },
            ),
          ),
        ],
      ),
    );
  }
}

// Privacy Policy Screen



class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Last updated: June 28, 2024",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "This Privacy Policy describes Our policies and procedures on the collection, "
                    "use and disclosure of Your information when You use the Service and tells You "
                    "about Your privacy rights and how the law protects You.\n"
                    "\n"
                    "We use Your Personal data to provide and improve the Service. By using the "
                    "Service, You agree to the collection and use of information in accordance with "
                    "this Privacy Policy. This Privacy Policy has been created with the help of the "
                    "[Free Privacy Policy Generator](https://www.freeprivacypolicy.com/free-privacy-policy-generator/).\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Interpretation and Definitions\n"
                    "------------------------------\n"
                    "Interpretation\n"
                    "~~~~~~~~~~~~~~~\n"
                    "The words of which the initial letter is capitalized have meanings defined "
                    "under the following conditions. The following definitions shall have the same "
                    "meaning regardless of whether they appear in singular or in plural.\n"
                    "\n"
                    "Definitions\n"
                    "~~~~~~~~~~~\n"
                    "For the purposes of this Privacy Policy:\n"
                    "\n"
                    "* Account means a unique account created for You to access our Service or "
                    "parts of our Service.\n"
                    "* Affiliate means an entity that controls, is controlled by or is under "
                    "common control with a party, where 'control' means ownership of 50% or "
                    "more of the shares, equity interest or other securities entitled to vote "
                    "for election of directors or other managing authority.\n"
                    "* Application refers to Recepie app, the software program provided by the "
                    "Company.\n"
                    "* Company (referred to as either 'the Company', 'We', 'Us' or 'Our' in this "
                    "Agreement) refers to Recepie app.\n"
                    "* Country refers to: Kerala, India\n"
                    "* Device means any device that can access the Service such as a computer, a "
                    "cellphone or a digital tablet.\n"
                    "* Personal Data is any information that relates to an identified or "
                    "identifiable individual.\n"
                    "* Service refers to the Application.\n"
                    "* Service Provider means any natural or legal person who processes the data "
                    "on behalf of the Company. It refers to third-party companies or individuals "
                    "employed by the Company to facilitate the Service, to provide the Service on "
                    "behalf of the Company, to perform services related to the Service or to assist "
                    "the Company in analyzing how the Service is used.\n"
                    "* Usage Data refers to data collected automatically, either generated by the "
                    "use of the Service or from the Service infrastructure itself (for example, "
                    "the duration of a page visit).\n"
                    "* You means the individual accessing or using the Service, or the company, "
                    "or other legal entity on behalf of which such individual is accessing or "
                    "using the Service, as applicable.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Collecting and Using Your Personal Data\n"
                    "---------------------------------------\n"
                    "Types of Data Collected\n"
                    "~~~~~~~~~~~~~~~~~~~~~~~~\n"
                    "Personal Data\n"
                    "*************\n"
                    "While using Our Service, We may ask You to provide Us with certain personally "
                    "identifiable information that can be used to contact or identify You. "
                    "Personally identifiable information may include, but is not limited to:\n"
                    "* Email address\n"
                    "* Usage Data\n"
                    "\n"
                    "Usage Data\n"
                    "***********\n"
                    "Usage Data is collected automatically when using the Service.\n"
                    "\n"
                    "Usage Data may include information such as Your Device's Internet Protocol "
                    "address (e.g. IP address), browser type, browser version, the pages of our "
                    "Service that You visit, the time and date of Your visit, the time spent on "
                    "those pages, unique device identifiers and other diagnostic data.\n"
                    "\n"
                    "When You access the Service by or through a mobile device, We may collect "
                    "certain information automatically, including, but not limited to, the type of "
                    "mobile device You use, Your mobile device unique ID, the IP address of Your "
                    "mobile device, Your mobile operating system, the type of mobile Internet "
                    "browser You use, unique device identifiers and other diagnostic data.\n"
                    "\n"
                    "We may also collect information that Your browser sends whenever You visit "
                    "our Service or when You access the Service by or through a mobile device.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Use of Your Personal Data\n"
                    "~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                    "The Company may use Personal Data for the following purposes:\n"
                    "\n"
                    "* To provide and maintain our Service, including to monitor the usage of our "
                    "Service.\n"
                    "* To manage Your Account: to manage Your registration as a user of the Service. "
                    "The Personal Data You provide can give You access to different functionalities "
                    "of the Service that are available to You as a registered user.\n"
                    "* For the performance of a contract: the development, compliance and undertaking "
                    "of the purchase contract for the products, items or services You have purchased "
                    "or of any other contract with Us through the Service.\n"
                    "* To contact You: To contact You by email, telephone calls, SMS, or other "
                    "equivalent forms of electronic communication, such as a mobile application's "
                    "push notifications regarding updates or informative communications related to "
                    "the functionalities, products or contracted services, including the security "
                    "updates, when necessary or reasonable for their implementation.\n"
                    "* To provide You with news, special offers and general information about other "
                    "goods, services and events which we offer that are similar to those that you "
                    "have already purchased or enquired about unless You have opted not to receive "
                    "such information.\n"
                    "* To manage Your requests: To attend and manage Your requests to Us.\n"
                    "* For business transfers: We may use Your information to evaluate or conduct a "
                    "merger, divestiture, restructuring, reorganization, dissolution, or other sale "
                    "or transfer of some or all of Our assets, whether as a going concern or as "
                    "part of bankruptcy, liquidation, or similar proceeding, in which Personal Data "
                    "held by Us about our Service users is among the assets transferred.\n"
                    "* For other purposes: We may use Your information for other purposes, such as "
                    "data analysis, identifying usage trends, determining the effectiveness of our "
                    "promotional campaigns and to evaluate and improve our Service, products, "
                    "services, marketing and your experience.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "We may share Your personal information in the following situations:\n"
                    "\n"
                    "* With Service Providers: We may share Your personal information with Service "
                    "Providers to monitor and analyze the use of our Service, to contact You.\n"
                    "* For business transfers: We may share or transfer Your personal information in "
                    "connection with, or during negotiations of, any merger, sale of Company assets, "
                    "financing, or acquisition of all or a portion of Our business to another company.\n"
                    "* With Affiliates: We may share Your information with Our affiliates, in which "
                    "case we will require those affiliates to honor this Privacy Policy. Affiliates "
                    "include Our parent company and any other subsidiaries, joint venture partners or "
                    "other companies that We control or that are under common control with Us.\n"
                    "* With business partners: We may share Your information with Our business partners "
                    "to offer You certain products, services or promotions.\n"
                    "* With other users: when You share personal information or otherwise interact in "
                    "the public areas with other users, such information may be viewed by all users "
                    "and may be publicly distributed outside.\n"
                    "* With Your consent: We may disclose Your personal information for any other "
                    "purpose with Your consent.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Retention of Your Personal Data\n"
                    "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                    "The Company will retain Your Personal Data only for as long as is necessary for "
                    "the purposes set out in this Privacy Policy. We will retain and use Your "
                    "Personal Data to the extent necessary to comply with our legal obligations (for "
                    "example, if we are required to retain your data to comply with applicable laws), "
                    "resolve disputes, and enforce our legal agreements and policies.\n"
                    "\n"
                    "The Company will also retain Usage Data for internal analysis purposes. Usage "
                    "Data is generally retained for a shorter period of time, except when this data "
                    "is used to strengthen the security or to improve the functionality of Our "
                    "Service, or We are legally obligated to retain this data for longer time periods.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Transfer of Your Personal Data\n"
                    "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                    "Your information, including Personal Data, is processed at the Company's operating "
                    "offices and in any other places where the parties involved in the processing are "
                    "located. It means that this information may be transferred to — and maintained on "
                    "— computers located outside of Your state, province, country or other governmental "
                    "jurisdiction where the data protection laws may differ than those from Your jurisdiction.\n"
                    "\n"
                    "Your consent to this Privacy Policy followed by Your submission of such information "
                    "represents Your agreement to that transfer.\n"
                    "\n"
                    "The Company will take all steps reasonably necessary to ensure that Your data is "
                    "treated securely and in accordance with this Privacy Policy and no transfer of Your "
                    "Personal Data will take place to an organization or a country unless there are adequate "
                    "controls in place including the security of Your data and other personal information.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Delete Your Personal Data\n"
                    "~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                    "You have the right to delete or request that We assist in deleting the Personal Data "
                    "that We have collected about You.\n"
                    "\n"
                    "Our Service may give You the ability to delete certain information about You from within "
                    "the Service.\n"
                    "\n"
                    "You may update, amend, or delete Your information at any time by signing in to Your Account, "
                    "if you have one, and visiting the account settings section that allows you to manage Your "
                    "personal information. You may also contact Us to request access to, correct, or delete any "
                    "personal information that You have provided to Us.\n"
                    "\n"
                    "Please note, however, that We may need to retain certain information when we have a legal "
                    "obligation or lawful basis to do so.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Disclosure of Your Personal Data\n"
                    "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                    "Business Transactions\n"
                    "*********************\n"
                    "If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may "
                    "be transferred. We will provide notice before Your Personal Data is transferred and becomes "
                    "subject to a different Privacy Policy.\n"
                    "\n"
                    "Law enforcement\n"
                    "***************\n"
                    "Under certain circumstances, the Company may be required to disclose Your Personal Data if "
                    "required to do so by law or in response to valid requests by public authorities (e.g. a court "
                    "or a government agency).\n"
                    "\n"
                    "Other legal requirements\n"
                    "************************\n"
                    "The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:\n"
                    "\n"
                    "* Comply with a legal obligation\n"
                    "* Protect and defend the rights or property of the Company\n"
                    "* Prevent or investigate possible wrongdoing in connection with the Service\n"
                    "* Protect the personal safety of Users of the Service or the public\n"
                    "* Protect against legal liability\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Security of Your Personal Data\n"
                    "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                    "The security of Your Personal Data is important to Us, but remember that no method of "
                    "transmission over the Internet, or method of electronic storage is 100% secure. While We "
                    "strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee "
                    "its absolute security.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Children's Privacy\n"
                    "------------------\n"
                    "Our Service does not address anyone under the age of 13. We do not knowingly collect personally "
                    "identifiable information from anyone under the age of 13. If You are a parent or guardian and "
                    "You are aware that Your child has provided Us with Personal Data, please contact Us. If We become "
                    "aware that We have collected Personal Data from anyone under the age of 13 without verification of "
                    "parental consent, We take steps to remove that information from Our servers.\n"
                    "\n"
                    "If We need to rely on consent as a legal basis for processing Your information and Your country requires "
                    "consent from a parent, We may require Your parent's consent before We collect and use that information.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Links to Other Websites\n"
                    "-----------------------\n"
                    "Our Service may contain links to other websites that are not operated by Us. If You click on a third party "
                    "link, You will be directed to that third party's site. We strongly advise You to review the Privacy Policy "
                    "of every site You visit.\n"
                    "\n"
                    "We have no control over and assume no responsibility for the content, privacy policies or practices of any "
                    "third party sites or services.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Changes to this Privacy Policy\n"
                    "----------------------------\n"
                    "We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new "
                    "Privacy Policy on this page.\n"
                    "\n"
                    "We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming "
                    "effective and update the 'Last updated' date at the top of this Privacy Policy.\n"
                    "\n"
                    "You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy "
                    "are effective when they are posted on this page.\n",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 12),
              Text(
                "Contact Us\n"
                    "----------\n"
                    "If you have any questions about this Privacy Policy, You can contact us:\n"
                    "\n"
                    "* By phone number: 8089431452\n",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// Terms and Conditions Screen

class TermsConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last updated: June 28, 2024',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Please read these terms and conditions carefully before using Our Service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Interpretation and Definitions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Interpretation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'The words of which the initial letter is capitalized have meanings defined '
                  'under the following conditions. The following definitions shall have the same '
                  'meaning regardless of whether they appear in singular or in plural.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Definitions',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'For the purposes of these Terms and Conditions:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- Application means the software program provided by the Company downloaded '
                  'by You on any electronic device, named Hello Cheff.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- Application Store means the digital distribution service operated and '
                  'developed by Apple Inc. (Apple App Store) or Google Inc. (Google Play Store) '
                  'in which the Application has been downloaded.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- Affiliate means an entity that controls, is controlled by or is under '
                  'common control with a party, where "control" means ownership of 50% or '
                  'more of the shares, equity interest or other securities entitled to vote '
                  'for election of directors or other managing authority.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- Country refers to: Kerala, India.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- Company (referred to as either "the Company", "We", "Us" or "Our" in this '
                  'Agreement) refers to Hello Cheff.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- Device means any device that can access the Service such as a computer, a '
                  'cellphone or a digital tablet.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- Service refers to the Application.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- Terms and Conditions (also referred as "Terms") mean these Terms and '
                  'Conditions that form the entire agreement between You and the Company '
                  'regarding the use of the Service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- Third-party Social Media Service means any services or content (including '
                  'data, information, products or services) provided by a third-party that '
                  'may be displayed, included or made available by the Service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- You means the individual accessing or using the Service, or the company, '
                  'or other legal entity on behalf of which such individual is accessing or '
                  'using the Service, as applicable.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Acknowledgment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'These are the Terms and Conditions governing the use of this Service and the '
                  'agreement that operates between You and the Company. These Terms and '
                  'Conditions set out the rights and obligations of all users regarding the use '
                  'of the Service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Your access to and use of the Service is conditioned on Your acceptance of and '
                  'compliance with these Terms and Conditions. These Terms and Conditions apply '
                  'to all visitors, users and others who access or use the Service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'By accessing or using the Service You agree to be bound by these Terms and '
                  'Conditions. If You disagree with any part of these Terms and Conditions then '
                  'You may not access the Service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'You represent that you are over the age of 18. The Company does not permit '
                  'those under 18 to use the Service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Your access to and use of the Service is also conditioned on Your acceptance '
                  'of and compliance with the Privacy Policy of the Company. Our Privacy Policy '
                  'describes Our policies and procedures on the collection, use and disclosure of '
                  'Your personal information when You use the Application or the Website and '
                  'tells You about Your privacy rights and how the law protects You. Please read '
                  'Our Privacy Policy carefully before using Our Service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Links to Other Websites',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Our Service may contain links to third-party web sites or services that are '
                  'not owned or controlled by the Company.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'The Company has no control over, and assumes no responsibility for, the '
                  'content, privacy policies, or practices of any third party web sites or '
                  'services. You further acknowledge and agree that the Company shall not be '
                  'responsible or liable, directly or indirectly, for any damage or loss caused '
                  'or alleged to be caused by or in connection with the use of or reliance on any '
                  'such content, goods or services available on or through any such web sites or '
                  'services.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'We strongly advise You to read the terms and conditions and privacy policies '
                  'of any third-party web sites or services that You visit.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Termination',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'We may terminate or suspend Your access immediately, without prior notice or '
                  'liability, for any reason whatsoever, including without limitation if You '
                  'breach these Terms and Conditions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Upon termination, Your right to use the Service will cease immediately.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Limitation of Liability',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Notwithstanding any damages that You might incur, the entire liability of the '
                  'Company and any of its suppliers under any provision of this Terms and Your '
                  'exclusive remedy for all of the foregoing shall be limited to the amount '
                  'actually paid by You through the Service or 100 USD if You haven\'t purchased '
                  'anything through the Service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'To the maximum extent permitted by applicable law, in no event shall the '
                  'Company or its suppliers be liable for any special, incidental, indirect, or '
                  'consequential damages whatsoever (including, but not limited to, damages for '
                  'loss of profits, loss of data or other information, for business interruption, '
                  'for personal injury, loss of privacy arising out of or in any way related to '
                  'the use of or inability to use the Service, third-party software and/or third-'
                  'party hardware used with the Service, or otherwise in connection with any '
                  'provision of this Terms), even if the Company or any supplier has been advised '
                  'of the possibility of such damages and even if the remedy fails of its '
                  'essential purpose.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Some states do not allow the exclusion of implied warranties or limitation of '
                  'liability for incidental or consequential damages, which means that some of '
                  'the above limitations may not apply. In these states, each party\'s liability '
                  'will be limited to the greatest extent permitted by law.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              '"AS IS" and "AS AVAILABLE" Disclaimer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'The Service is provided to You "AS IS" and "AS AVAILABLE" and with all faults '
                  'and defects without warranty of any kind. To the maximum extent permitted '
                  'under applicable law, the Company, on its own behalf and on behalf of its '
                  'Affiliates and its and their respective licensors and service providers, '
                  'expressly disclaims all warranties, whether express, implied, statutory or '
                  'otherwise, with respect to the Service, including all implied warranties of '
                  'merchantability, fitness for a particular purpose, title and non-infringement, '
                  'and warranties that may arise out of course of dealing, course of performance, '
                  'usage or trade practice. Without limitation to the foregoing, the Company '
                  'provides no warranty or undertaking, and makes no representation of any kind '
                  'that the Service will meet Your requirements, achieve any intended results, be '
                  'compatible or work with any other software, applications, systems or services, '
                  'operate without interruption, meet any performance or reliability standards or '
                  'be error free or that any errors or defects can or will be corrected.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Without limiting the foregoing, neither the Company nor any of the company\'s '
                  'provider makes any representation or warranty of any kind, express or implied: '
                  '(i) as to the operation or availability of the Service, or the information, '
                  'content, and materials or products included thereon; (ii) that the Service '
                  'will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or '
                  'currency of any information or content provided through the Service; or (iv) '
                  'that the Service, its servers, the content, or e-mails sent from or on behalf '
                  'of the Company are free of viruses, scripts, trojan horses, worms, malware, '
                  'timebombs or other harmful components.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Some jurisdictions do not allow the exclusion of certain types of warranties '
                  'or limitations on applicable statutory rights of a consumer, so some or all of '
                  'the above exclusions and limitations may not apply to You. But in such a case '
                  'the exclusions and limitations set forth in this section shall be applied to '
                  'the greatest extent enforceable under applicable law.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Governing Law',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'The laws of the Country, excluding its conflicts of law rules, shall govern '
                  'this Terms and Your use of the Service. Your use of the Application may also '
                  'be subject to other local, state, national, or international laws.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Disputes Resolution',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'If You have any concern or dispute about the Service, You agree to first try '
                  'to resolve the dispute informally by contacting the Company.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'For European Union (EU) Users',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'If You are a European Union consumer, you will benefit from any mandatory '
                  'provisions of the law of the country in which You are resident.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'United States Legal Compliance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'You represent and warrant that (i) You are not located in a country that is '
                  'subject to the United States government embargo, or that has been designated '
                  'by the United States government as a "terrorist supporting" country, and (ii) '
                  'You are not listed on any United States government list of prohibited or '
                  'restricted parties.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Severability and Waiver',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Severability',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'If any provision of these Terms is held to be unenforceable or invalid, such '
                  'provision will be changed and interpreted to accomplish the objectives of such '
                  'provision to the greatest extent possible under applicable law and the '
                  'remaining provisions will continue in full force and effect.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Waiver',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'Except as provided herein, the failure to exercise a right or to require '
                  'performance of an obligation under these Terms shall not affect a party\'s '
                  'ability to exercise such right or require such performance at any time '
                  'thereafter nor shall the waiver of a breach constitute a waiver of any '
                  'subsequent breach.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Translation Interpretation',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'These Terms and Conditions may have been translated if We have made them '
                  'available to You on our Service. You agree that the original English text '
                  'shall prevail in the case of a dispute.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Changes to These Terms and Conditions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'We reserve the right, at Our sole discretion, to modify or replace these Terms '
                  'at any time. If a revision is material We will make reasonable efforts to '
                  'provide at least 30 days\' notice prior to any new terms taking effect. What '
                  'constitutes a material change will be determined at Our sole discretion.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'By continuing to access or use Our Service after those revisions become '
                  'effective, You agree to be bound by the revised terms. If You do not agree to '
                  'the new terms, in whole or in part, please stop using the website and the '
                  'Service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(
              'If you have any questions about these Terms and Conditions, You can contact '
                  'us:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            Text(
              '- By phone number: 8089431452',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}


class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body:  Text("Hello Cheff aims to inspire users to explore new flavors,"
    " improve their cooking skills,"
    " and enjoy the process of cooking delicious meals with confidence and convenience, "
    "all from the convenience of their mobile device.",
        style: TextStyle(fontSize: 18,),


      ),
       );
  }
}