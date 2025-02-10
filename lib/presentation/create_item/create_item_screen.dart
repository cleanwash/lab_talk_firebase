import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab_talk_firebase/core/components/app_bar_custom.dart';
import 'package:lab_talk_firebase/core/components/elevated_button_custom.dart';
import 'package:lab_talk_firebase/core/components/text_form_field_custom.dart';
import 'package:lab_talk_firebase/core/theme/palette.dart';
import 'package:lab_talk_firebase/core/theme/typography.dart';
import 'package:lab_talk_firebase/core/util/routing/router_path.dart';
import 'package:lab_talk_firebase/presentation/create_item/create_item_view_model.dart';
import 'package:provider/provider.dart';

class CreateItemScreen extends StatefulWidget {
  const CreateItemScreen({super.key});

  @override
  State<CreateItemScreen> createState() => _CreateItemScreenState();
}

class _CreateItemScreenState extends State<CreateItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productCodeController = TextEditingController();
  final _manufacturerController = TextEditingController();
  final _quantityController = TextEditingController();
  final _volumeController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _productNameController.dispose();
    _productCodeController.dispose();
    _manufacturerController.dispose();
    _quantityController.dispose();
    _volumeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CreateItemViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBarCustom(
        title: '물건 등록',
        leadingIcon: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormFieldCustom(
                sectionText: '제품 정보',
                controller: _productNameController,
                hintText: '제품명을 입력해주세요',
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제품명을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormFieldCustom(
                controller: _productCodeController,
                hintText: '제품 코드를 입력해주세요',
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제품 코드를 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormFieldCustom(
                controller: _manufacturerController,
                hintText: '제조사를 입력해주세요',
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제조사를 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormFieldCustom(
                controller: _quantityController,
                hintText: '수량을 입력해주세요',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '수량을 입력해주세요';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormFieldCustom(
                sectionText: '추가 정보',
                controller: _volumeController,
                hintText: '용량을 입력해주세요 (선택사항)',
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextFormFieldCustom(
                controller: _descriptionController,
                hintText: '제품에 대한 설명을 입력해주세요 (선택사항)',
                maxLines: 3,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: 23),
              ElevatedButtonCustom(
                text: state.isLoading ? '등록 중...' : '작성 완료',
                onLoginClick: () {
                  if (!_formKey.currentState!.validate()) return;
                  viewModel
                      .submitForm(
                    productName: _productNameController.text,
                    productCode: _productCodeController.text,
                    manufacturer: _manufacturerController.text,
                    quantity: _quantityController.text,
                    volume: _volumeController.text,
                    description: _descriptionController.text,
                  )
                      .then((_) {
                    if (mounted) {
                      context.pushReplacement(RouterPath.home);
                    }
                  });
                },
                style: displayMedium,
                backgroundColor: Palette.green,
                fontColor: Palette.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
