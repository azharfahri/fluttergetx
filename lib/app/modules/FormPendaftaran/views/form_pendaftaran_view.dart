import 'package:flutter/material.dart';

import 'package:get/get.dart';


import 'package:intl/intl.dart';
import '../controllers/form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({super.key});
  @override
  Widget build(BuildContext context) {
    final FormPendaftaranController controller = Get.put(
      FormPendaftaranController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('FormPendaftaranView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validatename(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    errorText: controller.nameError.value.isNotEmpty
                        ? controller.nameError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),

              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty
                      ? null
                      : controller.gender.value,
                  hint: Text('Pilih Jenis Kelamin'),
                  items: ['Laki-laki', 'Perempuan']
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.gender.value = value ?? '';
                    //controller.validatename(gender: jenisKelamin);
                  },
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    errorText: controller.genderError.value.isNotEmpty
                        ? controller.genderError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              //tgllahir
              Obx(
                () => ListTile(
                  title: Text(
                    controller.dateOfBirth.value == null
                        ? 'Pilih Tanggal Lahir'
                        : DateFormat(
                            'dd-MM-yyyy',
                          ).format(controller.dateOfBirth.value!),
                  ),
                  trailing: Icon(Icons.calendar_today_outlined),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      controller.dateOfBirth.value = selectedDate;
                      controller.validateDateOfBirth(
                        tanggalLahir: selectedDate,
                      );
                    }
                  },
                  subtitle: controller.dateOfBirthError.value.isNotEmpty
                      ? Text(
                          controller.dateOfBirthError.value,
                          style: TextStyle(color: Colors.red),
                        )
                      : null,
                ),
              ),

              SizedBox(height: 20),

              //phone
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.phone.value = value;
                    //controller.validatePhone(value);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    errorText: controller.phoneError.value.isNotEmpty
                        ? controller.phoneError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.submitForm();
                },
                child: Text('submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
