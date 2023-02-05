import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reewer_app/data/models/export.dart';
import 'package:reewer_app/shared/export.dart';
import 'package:reewer_app/utils/export.dart';

typedef CountryData = Map<String, dynamic>;

class CountryField extends StatefulWidget {
  final CscCountry? defaultCountry;
  final ValueChanged<String> onChanged;
  final List<CscCountry>? countryFilter;
  final CountryData? currentCountry;

  const CountryField({
    required this.onChanged,
    this.defaultCountry,
    this.countryFilter,
    this.currentCountry,
    Key? key,
  }) : super(key: key);

  @override
  State<CountryField> createState() => _CountryFieldState();
}

class _CountryFieldState extends State<CountryField> {
  final List<CountryData> _country = [];
  List<CscCountry> _countryFilter = [];
  String? _selectedCountry;
  String? _selectedFlag;

  @override
  void initState() {
    super.initState();
    setDefaults();
    if (widget.countryFilter != null) {
      _countryFilter = widget.countryFilter!;
    }
    getCountries();
  }

  Future<void> setDefaults() async {
    if (widget.currentCountry != null) {
      setState(() {
        _selectedCountry = widget.currentCountry?.keys.first;
        _selectedFlag = widget.currentCountry?.values.first;
      });
    }
  }

  void _setDefaultCountry() {
    if (widget.defaultCountry != null) {
      _onSelectedCountry(_country[Constants.countries[widget.defaultCountry]!]);
    }
  }

  Future<dynamic> getResponse() async {
    final res = await rootBundle.loadString('assets/country/country.json');

    return jsonDecode(res);
  }

  Future<List<CountryData>> getCountries() async {
    _country.clear();
    final countries = await getResponse() as List;
    if (_countryFilter.isNotEmpty) {
      for (final element in _countryFilter) {
        final result = countries[Constants.countries[element]!];
        if (result != null) addCountryToList(result);
      }
    } else {
      for (final data in countries) {
        addCountryToList(data);
      }
    }
    _setDefaultCountry();

    return _country;
  }

  void addCountryToList(dynamic data) {
    final model = Country();
    model.name = data['name'];
    model.emoji = data['emoji'];
    if (!mounted) return;
    setState(() {
      _country.add({model.name!: model.emoji});
    });
  }

  void _onSelectedCountry(CountryData value) {
    if (!mounted) return;
    setState(() {
      widget.onChanged(value.keys.first);

      if (value.keys.first != _selectedCountry &&
          value.values.first != _selectedFlag) {
        _selectedCountry = value.keys.first;
        _selectedFlag = value.values.first;
      }
    });
  }

  Future<List<CountryData>> getCountryData(String filter) async {
    final filteredList = _country
        .where(
          (country) => country[filter].toLowerCase().contains(
                filter.toLowerCase(),
              ),
        )
        .toList();

    if (filteredList.isEmpty) {
      return _country;
    } else {
      return filteredList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Country',
            style: AppTextStyles.black16Medium500,
          ),
          SizedBox(
            height: 5,
          ),
          AbsorbPointer(
            absorbing: false,
            child: GestureDetector(
              onTap: () {
                showDialog<dynamic>(
                  context: context,
                  builder: (context) => SearchDialog(
                    items: _country.map((CountryData dropDownStringItem) {
                      return dropDownStringItem;
                    }).toList(),
                  ),
                ).then((value) {
                  widget.onChanged(value.keys.first);
                  _onSelectedCountry(value);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.greyDefault,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedCountry != null
                            ? _selectedCountry!
                            : 'Country',
                        overflow: TextOverflow.visible,
                        style: _selectedCountry != null
                            ? AppTextStyles.black14Medium400
                            : AppTextStyles.grey14Medium400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        _selectedFlag != null ? _selectedFlag! : '',
                        overflow: TextOverflow.visible,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SvgPicture.asset(
                      AppIcons.arrow,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
