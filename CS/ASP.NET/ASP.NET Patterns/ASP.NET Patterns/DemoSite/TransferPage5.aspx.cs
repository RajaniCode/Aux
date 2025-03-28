using System;
using System.Collections;
using System.Web;

public partial class TransferPage5 : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    // display actual URL of currently executing page
    lblActualPath.Text = Request.CurrentExecutionFilePath;
    String qs = Request.QueryString.ToString();
    if (qs != null && qs != String.Empty)
    {
      lblActualPath.Text += '?' + qs;
    }
  }
  //------------------------------------------------

  protected void btn_Build_Click(object sender, EventArgs e)
  {
    // create instances of classes that will observe
    // the subject (the ProductionLine class) and get
    // notified when required. Any class that implements
    // IObserver can be used here in this example
    PartsDept parts = new PartsDept();
    TransportDept transport = new TransportDept();
    SalesDept sales = new SalesDept();

    // create instance of subject class that contains
    // the method that will notify subscribed observers
    ProductionLine pLine = new ProductionLine();

    // subscribe the observers according to settings in page
    if (chk_Parts.Checked)
    {
      pLine.Helper.AddObserver(parts);
    }
    if (chk_Transport.Checked)
    {
      pLine.Helper.AddObserver(transport);
    }
    if (chk_Sales.Checked)
    {
      pLine.Helper.AddObserver(sales);
    }

    // call the main method of the subject class to do the
    // actual work required, specifying any properties required
    // in this example, just the name of the car to build
    pLine.BuildNewMotorCar(lstCarName.SelectedValue);

    // display counter values from observers to show that they
    // were notified by the ProductionLine main routine
    lblResults.Text += "<b>Cars to deliver</b>: "
                    + ShowAllCarsCount(transport.CountOfCarsToDeliver);
    lblResults.Text += "<b>Cars available to sell</b>: "
                    + ShowAllCarsCount(sales.CountOfCarsBuilt);
    lblResults.Text += "<b>Parts to order</b>: " 
                    + ShowAllCarsCount(parts.CountOfPartsUsed);
  }
  //------------------------------------------------

  private String ShowAllCarsCount(Hashtable values)
  {
    // get list of car models and count as a String
    String result = String.Empty;
    foreach (DictionaryEntry item in values)
    {
      result += item.Key.ToString() + ":" + item.Value.ToString() + " ";
    }
    return result + "<br />";
  }
  //------------------------------------------------

  protected void btn_Close_Click(object sender, EventArgs e)
  {
    Response.Redirect("Default.aspx");
  }
  //------------------------------------------------
}
