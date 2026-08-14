import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart' hide Barcode;


class AppQrScanner extends StatefulWidget {
  final Function(String) onQrScan;

  const AppQrScanner({super.key, required this.onQrScan});

  @override
  State<AppQrScanner> createState() => _AppQrScannerState();
}

class _AppQrScannerState extends State<AppQrScanner> {
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  io.File? _image;
  final picker = ImagePicker();
  final BarcodeScanner _barcodeScanner = BarcodeScanner();
  QRViewController? _controller;
  bool isFlashOn = false;
  bool _hasScanned = false;

  Future<void> _onQRViewCreated(QRViewController controller) async {
    _controller = controller;
    //This code fixes the issue with the camera that displaying a black screen
    await _controller?.pauseCamera();
    await _controller?.resumeCamera();
    _controller?.scannedDataStream.listen((scanData) {
      final code = scanData.code;
      if (_hasScanned || code == null || code.isEmpty) return;
      _hasScanned = true;
      _controller?.pauseCamera();
      widget.onQrScan.call(code);
    });
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    _image = io.File(pickedFile.path);
    final inputImage = InputImage.fromFile(_image!);
    final barcodes = await _barcodeScanner.processImage(inputImage);

    if (!mounted || barcodes.isEmpty) return;

    final code = barcodes.first.rawValue;
    if (code == null || code.isEmpty) return;

    widget.onQrScan.call(code);
  }

  Future<void> flashLight() async {
    try {
      await _controller?.toggleFlash();
      setState(() {
        isFlashOn = !isFlashOn;
      });
    } catch (e) {
      return;
    }
  }

  @override
  void dispose() {
    _barcodeScanner.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Theme.of(context).primaryColor,
              borderRadius: 10.r,
              borderLength: 30.h,
              borderWidth: 10.w,
              cutOutSize: 300.r,
            ),
          ),
        ),
        Positioned(
          bottom: 15.h,
          right: 15.w,
          child: IconButton(
            onPressed: pickImage,
            icon: Icon(
              Icons.photo_library_sharp,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 25.w,
            ),
          ),
        ),
        Positioned(
          bottom: 15.h,
          left: 15.w,
          child: IconButton(
            onPressed: flashLight,
            icon: Icon(
              isFlashOn ? Icons.flash_on : Icons.flash_off,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 25.w,
            ),
          ),
        ),
      ],
    );
  }
}
