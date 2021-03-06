XML xml;
XML[] trackpoints; //,trackpoints1, trackpoints2;
String xml1 = "2823479.xml";
String xml2 = "2823480.xml";
String xml3 = "2823481.xml";
String xml4 = "2823482.xml";
String xml5 = "2823483.xml";
String xml6 = "2823484.xml";
String xml7 = "2823485.xml";
String xml8 = "2823486.xml";
String xml9 = "2817909.xml";
String xml10= "2816774.xml";
double lat, lon;
double longMax=-3, longMin=0, latMax=-3, latMin=50;
int Time;
int time2;
int[] time_spent;
String[] tstamp;
int minTime_spent; 
int maxTime_spent;


void setup() {

  // to know overall working range
  load_file(xml1);
  load_file(xml2);
  load_file(xml3);
  load_file(xml4);
  load_file(xml5);
  load_file(xml6);
  load_file(xml7);
  load_file(xml8);
  load_file(xml9);
  load_file(xml10);

  println("LongMax =", longMax, "  Longmin=", longMin, "  Latmax=", latMax, "  latMin=", latMin);
  println("time_spentMin= ", minTime_spent, " maxtimespent = ", maxTime_spent);
}

void load_file(String file) {
  xml = loadXML(file);
  trackpoints  = xml.getChildren("trk")[0].getChildren("trkseg")[0].getChildren("trkpt");
  time_spent = new int[trackpoints.length];
  // check data
  for (int i = 0; i < trackpoints.length; i++) {
    //gps data
    lat = trackpoints[i].getDouble("lat");
    lon = trackpoints[i].getDouble("lon");

    //time data
     String t = trackpoints[i].getChildren("time")[0].getContent();
    tstamp = t.split("T")[1].split("\\.")[0].split(":"); //get only the time
    Time = int(tstamp[0])*3600 +  int(tstamp[1])*60 + int(tstamp[2]); // valeur de time unique, unique value of time in sec
    time_spent[i] = Time-time2; // time spent between 2 points
    time2 = Time; // value n-1 of Time
  }
  minmax(lon, lat);
  println("load "+file+" longMax "+longMax+" longMin "+longMin+" latMax "+latMax+" latMin "+latMin);
}


//to find min/max
void minmax(double lon, double lat) {
  //gps data
  if (lon>longMax) longMax = lon;
  if (lon<longMin) longMin = lon;
  if (lat>latMax)  latMax = lat;
  if (lat<latMin)  latMin = lat;

  //time data
  for (int i =0; i < trackpoints.length; i++ ) {
    if (time_spent[i] > maxTime_spent) {
      maxTime_spent = time_spent[i];
    }
    if (time_spent[i] < minTime_spent) {
      minTime_spent = time_spent[i];
    }
  }
}

void draw() {
}
