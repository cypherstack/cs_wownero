import 'dart:async';
import 'dart:io';

import 'package:cs_wownero/cs_wownero.dart';
import 'package:flutter/material.dart';

import '../util.dart';
import '../widgets/coin_selector_widget.dart';

class RestoreFromKeysView extends StatefulWidget {
  const RestoreFromKeysView({super.key});

  @override
  State<RestoreFromKeysView> createState() => _RestoreFromKeysViewState();
}

class _RestoreFromKeysViewState extends State<RestoreFromKeysView> {
  final nameController = TextEditingController();
  final pwController = TextEditingController();
  final viewKeyController = TextEditingController();
  final spendKeyController = TextEditingController();
  final languageController = TextEditingController()..text = "English";
  final heightController = TextEditingController();
  final addressController = TextEditingController();

  String _type = "monero";
  bool _locked = false;

  Future<Wallet> viewOnlyWallet(
    String type,
    String name,
    String password,
  ) async {
    final existing = await loadWalletNames(type);
    if (existing.contains(name)) {
      throw Exception("Wallet with name: \"$name\" already exists");
    }

    final path = await pathForWallet(
      name: name,
      type: type,
      createIfNotExists: true,
    );

    try {
      final wallet = await WowneroWallet.restoreWalletFromKeys(
        path: path,
        password: password,
        viewKey: viewKeyController.text,
        spendKey: spendKeyController.text,
        restoreHeight: int.tryParse(heightController.text) ?? 0,
        address: addressController.text,
        language: languageController.text,
      );

      unawaited(wallet.rescanBlockchain());

      return wallet;
    } catch (e) {
      // delete dir on failure
      final dir = await pathForWalletDir(
        name: nameController.text,
        type: _type,
        createIfNotExists: true,
      );
      Directory(dir).deleteSync(recursive: true);
      rethrow;
    }
  }

  Future<void> _onPressed() async {
    if (_locked) return;
    setState(() {
      _locked = true;
    });

    try {
      final _ = await viewOnlyWallet(
        _type,
        nameController.text,
        pwController.text,
      );

      if (mounted) {
        await showAdaptiveDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (_) => AlertDialog.adaptive(
            title: const Text("Success!"),
            content: Text("${nameController.text} created."),
          ),
        );
        if (mounted) Navigator.of(context).pop();
      }
    } catch (e, s) {
      if (mounted) {
        await showAdaptiveDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (_) => AlertDialog.adaptive(
            title: Text(e.toString()),
            content: Text(s.toString()),
          ),
        );
      }
    } finally {
      setState(() {
        _locked = false;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    pwController.dispose();
    heightController.dispose();
    viewKeyController.dispose();
    addressController.dispose();
    languageController.dispose();
    spendKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create View Only wallet'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CoinSelectorWidget(
          onChanged: (value) {
            setState(() {
              _type = value;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: pwController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: viewKeyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'View key',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: spendKeyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Spend key',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: languageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Seed language',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: heightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Restore height',
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextButton(
                  onPressed: _locked ? null : _onPressed,
                  child: const Text("Restore"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
