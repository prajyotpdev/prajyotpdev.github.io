import 'dart:js_interop';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/assets.dart';
import '../../constants/fonts.dart';
import '../../constants/strings.dart';
import '../../models/education.dart';
import '../../utils/screen/screen_utils.dart';
import '../../widgets/responsive_widget.dart';
import 'package:web/web.dart' as web;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();

  static const experienceList = [
    Experience('Aug 2023', 'Present', 'Revergon Solutions', 'Software Engineer'),
    Experience('July 2023', 'Aug 2023', 'Arpa Studios', 'Software Engineer'),
  ];
}

class _HomePageState extends State<HomePage> {
  void _launchUrl(String urlINput) async {
    final Uri url = Uri.parse(urlINput);
    if (await canLaunchUrl(url)) {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        debugPrint('Could not launch $url');
      }
    } else {
      throw 'Could not launch $url';
    }
  }

  late final web.EventListener _mouseLeaveListener;

  late final web.EventListener _mouseEnterListener;

  double dx = 0.0;

  double dy = 0.0;

  bool isOut = true;

  @override
  void initState() {
    super.initState();

    final docElement = web.document.documentElement;

    if (docElement != null) {
      // Create listeners
      _mouseLeaveListener = ((web.Event event) {
        setState(() {
          isOut = true;
        });
      }).toJS;

      _mouseEnterListener = ((web.Event event) {
        setState(() {
          isOut = false;
        });
      }).toJS;

      // Add listeners
      docElement.addEventListener('mouseleave', _mouseLeaveListener);
      docElement.addEventListener('mouseenter', _mouseEnterListener);
    }
  }

  @override
  void dispose() {
    final docElement = web.document.documentElement;

    if (docElement != null) {
      docElement.removeEventListener('mouseleave', _mouseLeaveListener);
      docElement.removeEventListener('mouseenter', _mouseEnterListener);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF7F8FA),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: (ScreenUtil.getInstance().setWidth(108))), //144
        child:Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0.0,
            title: _buildTitle(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: !ResponsiveWidget.isSmallScreen(context) ? _buildActions() : null,
          ),
          drawer: ResponsiveWidget.isSmallScreen(context)
              ? Drawer(
            child: ListView(padding: const EdgeInsets.all(20), children: _buildActions()),
          )
              : null,
          body: LayoutBuilder(
            builder: (context, constraints) {
              return _buildBody(context, constraints);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      title: _buildTitle(),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: !ResponsiveWidget.isSmallScreen(context) ? _buildActions() : null,
    );
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: TextStyle(fontSize: 14.0, color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: Strings.portfoli,
            style: TextStyle(
              fontFamily: Fonts.product,
              color: Color(0xFF45405B),
              fontSize: 22.0,
              //22.0
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          TextSpan(
            text: Strings.o,
            style: TextStyle(
              fontFamily: Fonts.product,
              color: Color(0xFF45405B),
              fontSize: 22.0,
              //22.0
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ).copyWith(color: Color(0xFF50AFC0)),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildActions() {
    return <Widget>[
      MaterialButton(
        child: Text(
          Strings.menu_home,
          style: TextStyle(
            fontFamily: Fonts.product,
            fontSize: 12.0, //12,.0
            letterSpacing: 1.0,
            color: Color(0xFF45405B),
          ).copyWith(color: Color(0xFF50AFC0)),
        ),
        onPressed: () {},
      ),
      MaterialButton(
        child: Text(
          Strings.menu_projects,
          style: TextStyle(
            fontFamily: Fonts.product,
            fontSize: 12.0, //12,.0
            letterSpacing: 1.0,
            color: Color(0xFF45405B),
          ),
        ),
        onPressed: () {},
      ),
      MaterialButton(
        child: Text(
          Strings.menu_blogs,
          style: TextStyle(
            fontFamily: Fonts.product,
            fontSize: 12.0, //12,.0
            letterSpacing: 1.0,
            color: Color(0xFF45405B),
          ),
        ),
        onPressed: () {},
      ),
      MaterialButton(
        child: Text(
          Strings.menu_resume,
          style: TextStyle(
            fontFamily: Fonts.product,
            fontSize: 12.0, //12,.0
            letterSpacing: 1.0,
            color: Color(0xFF45405B),
          ),
        ),
        onPressed: () async {
          final Uri url = Uri.parse('https://firebasestorage.googleapis.com/v0/b/rekord-48b83.firebasestorage.app/o/documents%2FPrajyot_Pawar_Resume_SDE_A4.pdf?alt=media&token=ffc588e2-03e6-40bd-8fc5-df04fe009115');
          if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not open resume')),
            );
          }
        }
      ),
    ];
  }

  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
        child: ResponsiveWidget(
          largeScreen: _buildLargeScreen(context),
          mediumScreen: _buildMediumScreen(context),
          smallScreen: _buildSmallScreen(context),
        ),
      ),
    );
  }

  Widget  _buildLargeScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 1, child: _buildContent(context)),
                Expanded(flex:1,child: _buildIllustration(context)),
              ],
            ),
          ),
          SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 48.0),
          ResponsiveWidget.isSmallScreen(context)
              ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_buildExperience(), SizedBox(height: 24.0), _buildSkills(context)],
          )
              : _buildSkillsAndExperience(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 1, child: _buildContent(context)),
                Expanded(flex:1,child: _buildIllustration(context)),],
            ),
          ),
          SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 48.0),
          ResponsiveWidget.isSmallScreen(context)
              ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_buildExperience(), SizedBox(height: 24.0), _buildSkills(context)],
          )
              : _buildSkillsAndExperience(context),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(flex: 1, child: _buildContent(context)),
          SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),
          ResponsiveWidget.isSmallScreen(context)
              ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_buildExperience(), SizedBox(height: 24.0), _buildSkills(context)],
          )
              : _buildSkillsAndExperience(context),
          const Divider(),
          _buildCopyRightText(context),
          SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 0.0),
          _buildSocialIcons(),
        ],
      ),
    );
  }

  Widget _buildIllustration(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CachedNetworkImage(
      imageUrl: Assets.programmer3,
      height: screenWidth * 0.24, // Adjust ratio as needed
      placeholder: (context, url) => SizedBox(height:50,width:50,child: const CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 24.0 : 200.0),
        _buildAboutMe(context),
        SizedBox(height: 4.0),
        _buildHeadline(context),
        SizedBox(height: ResponsiveWidget.isSmallScreen(context) ? 12.0 : 24.0),
        _buildSummary(),
      ],
    );
  }

  Widget _buildAboutMe(BuildContext context) {
    final isSmall = ResponsiveWidget.isSmallScreen(context);
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14.0, color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: Strings.about,
            style: TextStyle(
              fontFamily: Fonts.nexa_light,
              color: const Color(0xFF45405B),
              fontSize: isSmall ? 36.0 : 45.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          TextSpan(
            text: Strings.me,
            style: TextStyle(
              fontFamily: Fonts.nexa_bold,
              color: const Color(0xFF50AFC0),
              fontSize: isSmall ? 36.0 : 45.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline(BuildContext context) {
    return Text(
      ResponsiveWidget.isSmallScreen(context) ? Strings.headline : Strings.headline.replaceFirst(RegExp(r' f'), '\nf'),
      style: TextStyle(
        color: Color(0xFF45405B),
        fontFamily: Fonts.product,
        fontSize: 17.0, //17.0
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: EdgeInsets.only(right: 80.0),
      child: Text(
        Strings.summary,
        style: TextStyle(
          fontFamily: Fonts.product,
          color: Color(0xFF85819C),
          height: 1.5,
          fontSize: 12.0,
          //12.0
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildSkillsAndExperience(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(flex: 1, child: _buildExperience()),
        SizedBox(width: 40.0),
        Expanded(flex: 1, child: _buildSkills(context)),
      ],
    );
  }

  final skills = ['Flutter', 'Dart', 'AWS', 'Node.js', 'C++', 'Docker', 'Python', 'Solidity'];

  Widget _buildSkills(BuildContext context) {
    final List<Widget> widgets = skills
        .map((skill) => Padding(padding: EdgeInsets.only(right: 8.0, top: 3), child: _buildSkillChip(context, skill)))
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSkillsContainerHeading(),
        Wrap(children: widgets),
        //        _buildNavigationArrows(),
      ],
    );
  }

  Widget _buildSkillsContainerHeading() {
    return Text(
      Strings.skills_i_have,
      style: TextStyle(
        color: Color(0xFF45405B),
        fontFamily: Fonts.product,
        fontSize: 17.0, //17.0
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          fontFamily: Fonts.product,
          color: Color(0xFF85819C),
          height: 1.5,
          fontSize: 12.0,
          //12.0
          letterSpacing: 1.0,
        ).copyWith(fontSize: ResponsiveWidget.isSmallScreen(context) ? 10.0 : 11.0),
      ),
    );
  }

  Widget _buildExperience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildExperienceContainerHeading(),
        _buildExperienceSummary(),
        SizedBox(height: 8.0),
        _buildExperienceTimeline(),
      ],
    );
  }

  Widget _buildExperienceContainerHeading() {
    return Text(
      Strings.experience,
      style: TextStyle(
        color: Color(0xFF45405B),
        fontFamily: Fonts.product,
        fontSize: 17.0, //17.0
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildExperienceSummary() {
    return Text(
      'Flutter-focused Software Engineer with 2.5+ years of experience developing and deploying high-performance mobile applications.',
      style: TextStyle(
        fontFamily: Fonts.product,
        color: Color(0xFF85819C),
        height: 1.5,
        fontSize: 12.0,
        //12.0
        letterSpacing: 1.0,
      ),
    );
  }

  Widget _buildExperienceTimeline() {
    final List<Widget> widgets = HomePage.experienceList.map((experience) => _buildExperienceTile(experience)).toList();
    return Column(children: widgets);
  }

  Widget _buildExperienceTile(Experience experience) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            '${experience.post}',
            style: TextStyle(
              fontFamily: Fonts.product,
              color: Color(0xFF45405B),
              height: 1.5,
              fontSize: 15.0,
              //15.0
              letterSpacing: 1.0,
            ),
          ),
          Text(
            '${experience.organization}',
            style: TextStyle(
              fontFamily: Fonts.product,
              color: Color(0xFF85819C),
              height: 1.5,
              fontSize: 12.0,
              //12.0
              letterSpacing: 1.0,
            ).copyWith(color: Color(0xFF45405B)),
          ),
          Text(
            '${experience.from}-${experience.to}',
            style: TextStyle(
              fontFamily: Fonts.product,
              color: Color(0xFF85819C),
              height: 1.5,
              fontSize: 12.0,
              //12.0
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  // Footer Methods:------------------------------------------------------------
  Widget _buildFooter(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(child: _buildCopyRightText(context), alignment: Alignment.centerLeft),
              Align(child: _buildSocialIcons(), alignment: Alignment.centerRight),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCopyRightText(BuildContext context) {
    return Text(
      Strings.rights_reserved,
      style: TextStyle(
        fontFamily: Fonts.product,
        color: Color(0xFF85819C),
        height: 1.5,
        fontSize: 12.0,
        //12.0
        letterSpacing: 1.0,
      ).copyWith(fontSize: ResponsiveWidget.isSmallScreen(context) ? 8 : 10.0),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () => _launchUrl("https://www.linkedin.com/in/prajyot-pawar-579a5834b/"),
          child: CachedNetworkImage(
            imageUrl: Assets.linkedin,
            color: const Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
            errorWidget: (context, url, error) => const Icon(Icons.link, size: 20),
          ),
        ),
        const SizedBox(width: 16.0),
        GestureDetector(
          onTap: () => _launchUrl("https://medium.com/@prajyotp.dev"),
          child: CachedNetworkImage(
            imageUrl: Assets.evernote,
            color: const Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
        const SizedBox(width: 16.0),
        GestureDetector(
          onTap: () => _launchUrl("https://github.com/prajyotpdev"),
          child: CachedNetworkImage(imageUrl: Assets.github, color: const Color(0xFF45405B), height: 20.0, width: 20.0),
        ),
        const SizedBox(width: 16.0),
        GestureDetector(
          onTap: () => _launchUrl("https://x.com/PrajyotP326805"),
          child: CachedNetworkImage(
            imageUrl: Assets.twitter,
            color: const Color(0xFF45405B),
            height: 20.0,
            width: 20.0,
          ),
        ),
      ],
    );
  }
}
