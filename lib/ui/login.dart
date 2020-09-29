PreferredSize(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              height: _height * .03,
                              child: Text.rich(
                                  TextSpan(
                                    text: "Email address",
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      color: Colors.black26,
                                    ),
                                  )
                              ),
                            ),
                            Container(
                              height: _height * .05,
                              child: TextField(
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Maksud@gmail.com",
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.5,
                                        color: Colors.black
                                    )
                                ),
                                controller: controller,
                              ),
                            ),
                          ],
                        ),
                      ),


                      #1F4E79
                      #2E5395
Container(
          color: Colors.white,
          alignment: Alignment.center,
          height: _height,
          width: _width,
          child: Column(
            children: [
              SizedBox(
                height: _height * .04,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: _width * .02),
                height: _height * .10,
                width: _width * .86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.blue.shade500),
                    color: Colors.blue.shade500,
                ),
                child: Row(
                  children: [
                    Container(
                      width: _width * .20,
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/maksud.jpg"),
                      ),
                    ),
                    Container(
                      width: _width * .50,
                      alignment: Alignment.center,
                      child: Text(
                        "Maksudur Rahman",
                        style: TextStyle(
                            fontSize: 16.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]

          ),
        ),