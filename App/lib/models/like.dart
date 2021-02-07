class Like {
  String dogId;
  String fosterId;

  Like({ this.dogId, this.fosterId });


  toJson(){
    return {
      "dogId": this.dogId,
      "fosterId": this.fosterId
    };
  }
}