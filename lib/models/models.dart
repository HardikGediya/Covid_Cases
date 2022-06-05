class CovidCases {
  final String state;
  final int cases;

  CovidCases({
    required this.cases,
    required this.state,
  });

  factory CovidCases.fromJson(Map<String, dynamic> json,String state,String type) {
    return CovidCases(
      cases: json[state]["districtData"][type]["active"],
      state: state,
    );
  }
}


List <String> states = <String>[

  "Andhra Pradesh",
  "Arunachal Pradesh",
  "Assam",
  "Bihar",
  "Chhattisgarh",
  "Delhi",
  "Goa",
  "Gujarat",
  "Himachal Pradesh",
  "Haryana",
  "Jharkhand",
  "Jammu and Kashmir",
  "Karnataka",
  "Madhya Pradesh",
  "Manipur",
  "Mizoram",
  "Odisha",
  "Punjab",
  "Rajasthan",
  "Sikkim",
  "Telangana",
  "Uttar Pradesh",
  "Uttarakhand",
  "West Bengal",

];

List <String> type = <String>[


  "Foreign Evacuees",
  "Anjaw",
  "Airport Quarantine",
  "Araria",
  "Other State",
  "Central Delhi",
  "Other State",
  "Other State",
  "Bilaspur",
  "Ambala",
  "Bokaro",
  "Anantnag",
  "Bagalkote",
  "Agar Malwa",
  "CAPF Personnel",
  "Aizawl",
  "State Pool",
  "Amritsar",
  "Ajmer",
  "East Sikkim",
  "Foreign Evacuees",
  "Agra",
  "Almora",
  "Alipurduar",

];
