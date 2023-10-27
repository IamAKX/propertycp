import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:propertycp/models/lead_comment_model.dart';
import 'package:propertycp/models/leads_model.dart';
import 'package:propertycp/utils/colors.dart';
import 'package:propertycp/utils/date_time_formatter.dart';
import 'package:propertycp/utils/enum.dart';
import 'package:propertycp/utils/theme.dart';
import 'package:propertycp/widgets/gaps.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

import '../../models/user_model.dart';
import '../../services/api_service.dart';
import '../../services/snakbar_service.dart';
import '../../utils/constants.dart';
import '../../utils/preference_key.dart';

class CreateLead extends StatefulWidget {
  const CreateLead({super.key, required this.type});
  final String type;
  static const String routePath = '/createLeadScreen';

  @override
  State<CreateLead> createState() => _CreateLeadState();
}

class _CreateLeadState extends State<CreateLead> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _commentCtrl = TextEditingController();
  String? selectedType;

  UserModel? userModel;
  late ApiProvider _api;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => loadScreen(),
    );
  }

  loadScreen() async {
    _api.getUserById(SharedpreferenceKey.getUserId()).then((value) {
      setState(() {
        userModel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SnackBarService.instance.buildContext = context;
    _api = Provider.of<ApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Lead'),
      ),
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(defaultPadding),
      children: [
        Text(
          'Lead Type',
          style:
              Theme.of(context).textTheme.bodySmall?.copyWith(color: primary),
        ),
        DropdownButton2<String>(
          value: selectedType,
          underline: null,
          isExpanded: true,
          barrierLabel: 'Type',
          hint: Text(
            'Select type',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: leadType.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedType = value;
            });
          },
        ),
        TextField(
          controller: _phoneCtrl,
          maxLength: 10,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            hintText: 'Phone Number',
            label: Text('Phone Number'),
          ),
        ),
        TextField(
          controller: _nameCtrl,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            hintText: 'Full Name',
            label: Text('Full Name'),
          ),
        ),
        verticalGap(defaultPadding / 2),
        TextField(
          controller: _commentCtrl,
          maxLines: 4,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            hintText: 'Comment',
            label: Text('Comment'),
          ),
        ),
        verticalGap(defaultPadding * 1.5),
        ElevatedButton(
          onPressed: () {
            if (_nameCtrl.text.isEmpty ||
                _phoneCtrl.text.isEmpty ||
                _commentCtrl.text.isEmpty ||
                (selectedType?.isEmpty ?? true)) {
              SnackBarService.instance
                  .showSnackBarError('All fields are mandatory');
              return;
            }
            if (!isNumeric(_phoneCtrl.text) || _phoneCtrl.text.length != 10) {
              SnackBarService.instance
                  .showSnackBarError('Invalid phone number');
              return;
            }
            LeadCommentModel comment = LeadCommentModel(
                comment: _commentCtrl.text,
                timeStamp: DateTimeFormatter.now(),
                userType: userModel?.userType);
            LeadsModel lead = LeadsModel(
                leadCommentModel: [comment],
                createdById: userModel?.id,
                fullName: _nameCtrl.text,
                mobileNo: _phoneCtrl.text,
                propertyType: selectedType,
                createdDate: DateTimeFormatter.now(),
                updatedDate: DateTimeFormatter.now(),
                status: LeadStatus.OPEN.name);

            _api.createLead(lead).then((value) {
              if (value) {
                SnackBarService.instance.showSnackBarSuccess('Leads created');
                Navigator.pop(context);
              } else {
                SnackBarService.instance.showSnackBarError('Leads created');
              }
            });
          },
          child: const Text('Create lead'),
        ),
      ],
    );
  }
}
