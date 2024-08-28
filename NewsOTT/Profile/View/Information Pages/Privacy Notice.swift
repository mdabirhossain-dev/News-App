//
//  Privacy Notice.swift
//  News OTT Profile
//
//  Created by Tanvir Rahman on 9/10/23.
//

import SwiftUI


struct PrivacyNotice: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack{
                Color(red: 0.04, green: 0.11, blue: 0.31).ignoresSafeArea()
                ScrollView(.vertical) {
                    VStack(alignment: .leading){
                        Text("PRIVACY NOTICE")
                            .foregroundColor(Color(red: 0, green: 0.23, blue: 1))
                            .font(.custom(FontManager.Poppins.semiBold, size: 22))
                            .padding(.bottom)
                        
                        Text("DEMOS PRIVACY POLICY Demos follows the relevant legal requirements and takes all reasonable precautions to safeguard personal information. INTRODUCTION Demos is committed to protecting your privacy and security. This policy explains how and why we use your personal data, to ensure you remain informed and in control of your information. You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing hello@demos.co.uk, writing to 76 Vincent Square, London, SW1 2PD or 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri). We will never sell your personal data, and will only ever share it with organisations we work with where necessary and if its privacy and security are guaranteed. Personal information submitted to Demos is only used to contact you regarding Demos activities. Information about visitors to the Demos website domain is automatically logged for the purposes of statistical analysis. Such information includes the IP address from which you visit, referral address, and other technical information such as browser type and operating system. Your email address is not automatically logged without your knowledge. We will not distribute, sell, trade or rent your personal information to third parties. Demos may provide aggregate statistics about our website’s users, traffic patterns and related site information to reputable third-parties such as Demos’s funding bodies or potential partners. Such statistical information will not include personally identifying information. Questions? Any questions you have in relation to this policy or how we use your personal data should be sent to hello@demos.co.uk for the attention of Demos’ Head of External Affairs. ABOUT US Your personal data (i.e. any information which identifies you, or which can be identified as relating to you personally) will be collected and used by Demos (charity no:1042046, company registration no: 2977740). THE INFORMATION WE COLLECT Personal data you provide We collect data you provide to us. This includes information you give when joining as a member or signing up to our newsletter, placing an order or communicating with us. For example: personal details (name, job title, organisation and email) when you sign up to our newsletter and / or events. financial information (payment information such as credit/debit card or direct debit details, when making donations or paying for a service. Please see section 8 for more information on payment security); and details of Demos events you have attended. Sensitive personal data We do not normally collect or store sensitive personal data (such as information relating to health, beliefs or political affiliation) about those signed up to Demos’s newsletter. However there are some situations where this will occur (e.g. if you have an accident on one of our events). If this does occur, we’ll take extra care to ensure your privacy rights are protected. Accidents or incidents If an accident or incident occurs on our property, at one of our events or involving one of our staff then we’ll keep a record of this (which may include personal data and sensitive personal data). HOW WE USE INFORMATION We only ever use your personal data with your consent, or where it is necessary in order to: enter into, or perform, a contract with you; comply with a legal duty; protect your vital interests; for our own (or a third party’s) lawful interests, provided your rights don’t override these. In any event, we’ll only use your information for the purpose or purposes it was collected for (or else for closely related purposes). Administration We use personal data for administrative purposes (i.e. on our research and events programmes). This includes: maintaining databases of those signed up to our newsletter; fulfilling orders for goods or services (whether placed online, over the phone or in person); helping us respect your choices and preferences (e.g. if you ask not to receive marketing material, we’ll keep a record of this). DISCLOSING AND SHARING DATA Your personal data – which may include your name, organisation, position, and email address are held by our mailing list provider. By signing up to our newsletter you are agreeing to the terms and conditions of MailChimp.com (http://mailchimp.com/legal/terms/). This information is not shared with any other organisation. If you wish to unsubscribe from our mailing list at any time, you can do so by clicking the ‘unsubscribe’ link, found at the bottom of any email we send you – or by sending your name and email address to hello@demos.co.uk – stating ‘Unsubscribe’ in the email in the subject line or body of the email. If you register to attend an event, your personal data which may include your name, organisation, and email address are held by our event registration provider. By registering to attend an event you are agreeing to the terms and conditions of Eventbrite (https://www.eventbrite.com/l/LegalTerms/) Occasionally, where we partner with other organisations, we may also share information with them (for example, if you register to attend an event being jointly organised by us and another organisation). We’ll only share information when necessary and we will never share your contact information (e.g. email or telephone). MARKETING Demos will ask for individuals to “opt-in” for most communications. This includes all our marketing communications (the term marketing is broadly defined and covers information shared in our newsletter.) We use personal data to communicate with people, to promote Demos and to help with fundraising activities. This includes keeping you up to date with information from Demos on our research, events, news, job opportunities and other information relating to our work. You can decide not to receive communications or change how we contact you at any time. If you wish to do so please contact us by emailing hello@demos.co.uk, writing to Demos, 76 Vincent Square, London SW1P 2PD or telephoning 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri). What does ‘marketing’ mean? Marketing does not just mean offering things for sale, but also includes news and information about: our research programme, including details of recent reports or blogs; our events and activities; and job opportunities. When you receive a communication, we may collect information about how you respond to or interact with that communication, and this may affect how we communicate with you in future. HOW WE PROTECT DATA We employ a variety of physical and technical measures to keep your data safe and to prevent unauthorised access to, or use or disclosure of your personal information. Electronic data and databases are stored on secure computer systems and we control who has access to information (using both physical and electronic means). Our staff receive data protection training and we have a set of detailed data protection procedures which personnel are required to follow when handling personal data. Payment security All electronic Demos forms that request financial data use pass your details to our payment provider (Stripe Payments Europe: https://stripe.com/gb/privacy; https://stripe.com/privacy-shield-policy). Demos complies with the payment card industry data security standard (PCI-DSS) published by the PCI Security Standards Council, and will never store card details. If you would rather make a payment through BACS or by cheque please contact us by emailing hello@demos.co.uk, writing to Unit 1, Lloyd’s Wharf, 2-3 Mill Street, London SE1 2BD or telephoning 020 3878 3955 (Lines open 9.30am – 6pm, Mon – Fri). Of course, we cannot guarantee the security of your home computer or the internet, and any online communications (e.g. information provided by email or our website) are at the user’s own risk. STORAGE Where we store information Demos’ operations are based in England and we store our data within the European Union. How long we store information We will only use and store information for so long as it is required for the purposes it was collected for. How long information will be stored for depends on the information in question and what it is being used for. For example, if you ask us not to send you marketing emails, we will stop storing your emails for marketing purposes (though we’ll keep a record of your preference not to be emailed). We continually review what information we hold and delete what is no longer required. We never store payment card information.")
                            .foregroundColor(.white)
                            .font(.custom(FontManager.Poppins.medium, size: 10))
                            .multilineTextAlignment(.leading)
                            .edgesIgnoringSafeArea(.bottom)
                    }
                    .padding(.horizontal,10)
                    .padding(.bottom, 100)
                }.padding(.bottom)
            }
            
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    
                                    HStack(spacing: 0){
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                }label: {
                    Image("arrow-left")
                        .foregroundColor(.white)
                    
                }
                navigationPageTitle(title: "privacy-notice-str")
            }
            )
        }.navigationViewStyle(StackNavigationViewStyle())
            .background(Color(red: 0.04, green: 0.11, blue: 0.31).padding(.vertical, -10))
    }
}

