//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3053
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

[assembly: global::System.Data.Objects.DataClasses.EdmSchemaAttribute()]

// Original file name: ComplexTypeExample.ObjectLayer.cs
// Generation date: 9/8/2008 10:01:25 PM
namespace NWComplexTypeModel
{
    
    /// <summary>
    /// There are no comments for NWComplexTypeEntities in the schema.
    /// </summary>
    public partial class NWComplexTypeEntities : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new NWComplexTypeEntities object using the connection string found in the 'NWComplexTypeEntities' section of the application configuration file.
        /// </summary>
        public NWComplexTypeEntities() : 
                base("name=NWComplexTypeEntities", "NWComplexTypeEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new NWComplexTypeEntities object.
        /// </summary>
        public NWComplexTypeEntities(string connectionString) : 
                base(connectionString, "NWComplexTypeEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new NWComplexTypeEntities object.
        /// </summary>
        public NWComplexTypeEntities(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "NWComplexTypeEntities")
        {
            this.OnContextCreated();
        }
        partial void OnContextCreated();
        /// <summary>
        /// There are no comments for Employees in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Employee> Employees
        {
            get
            {
                if ((this._Employees == null))
                {
                    this._Employees = base.CreateQuery<Employee>("[Employees]");
                }
                return this._Employees;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Employee> _Employees;
        /// <summary>
        /// There are no comments for Customers in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Customer> Customers
        {
            get
            {
                if ((this._Customers == null))
                {
                    this._Customers = base.CreateQuery<Customer>("[Customers]");
                }
                return this._Customers;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Customer> _Customers;
        /// <summary>
        /// There are no comments for Employees in the schema.
        /// </summary>
        public void AddToEmployees(Employee employee)
        {
            base.AddObject("Employees", employee);
        }
        /// <summary>
        /// There are no comments for Customers in the schema.
        /// </summary>
        public void AddToCustomers(Customer customer)
        {
            base.AddObject("Customers", customer);
        }
    }
    /// <summary>
    /// There are no comments for NWComplexTypeModel.Employee in the schema.
    /// </summary>
    /// <KeyProperties>
    /// EmployeeID
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="NWComplexTypeModel", Name="Employee")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Employee : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Employee object.
        /// </summary>
        /// <param name="employeeID">Initial value of EmployeeID.</param>
        /// <param name="lastName">Initial value of LastName.</param>
        /// <param name="firstName">Initial value of FirstName.</param>
        /// <param name="address">Initial value of Address.</param>
        public static Employee CreateEmployee(int employeeID, string lastName, string firstName, CommonAddress address)
        {
            Employee employee = new Employee();
            employee.EmployeeID = employeeID;
            employee.LastName = lastName;
            employee.FirstName = firstName;
            employee.Address = global::System.Data.Objects.DataClasses.StructuralObject.VerifyComplexObjectIsNotNull(address, "Address");
            return employee;
        }
        /// <summary>
        /// There are no comments for Property EmployeeID in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int EmployeeID
        {
            get
            {
                return this._EmployeeID;
            }
            set
            {
                this.OnEmployeeIDChanging(value);
                this.ReportPropertyChanging("EmployeeID");
                this._EmployeeID = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("EmployeeID");
                this.OnEmployeeIDChanged();
            }
        }
        private int _EmployeeID;
        partial void OnEmployeeIDChanging(int value);
        partial void OnEmployeeIDChanged();
        /// <summary>
        /// There are no comments for Property LastName in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string LastName
        {
            get
            {
                return this._LastName;
            }
            set
            {
                this.OnLastNameChanging(value);
                this.ReportPropertyChanging("LastName");
                this._LastName = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("LastName");
                this.OnLastNameChanged();
            }
        }
        private string _LastName;
        partial void OnLastNameChanging(string value);
        partial void OnLastNameChanged();
        /// <summary>
        /// There are no comments for Property FirstName in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string FirstName
        {
            get
            {
                return this._FirstName;
            }
            set
            {
                this.OnFirstNameChanging(value);
                this.ReportPropertyChanging("FirstName");
                this._FirstName = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("FirstName");
                this.OnFirstNameChanged();
            }
        }
        private string _FirstName;
        partial void OnFirstNameChanging(string value);
        partial void OnFirstNameChanged();
        /// <summary>
        /// There are no comments for Property Address in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmComplexPropertyAttribute()]
        [global::System.ComponentModel.DesignerSerializationVisibility(global::System.ComponentModel.DesignerSerializationVisibility.Content)]
        [global::System.Xml.Serialization.XmlElement(IsNullable=true)]
        [global::System.Xml.Serialization.SoapElement(IsNullable=true)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public CommonAddress Address
        {
            get
            {
                this._Address = this.GetValidValue(this._Address, "Address", false, this._AddressInitialized);
                this._AddressInitialized = true;
                return this._Address;
            }
            set
            {
                this.OnAddressChanging(value);
                this.ReportPropertyChanging("Address");
                this._Address = this.SetValidValue(this._Address, value, "Address");
                this._AddressInitialized = true;
                this.ReportPropertyChanged("Address");
                this.OnAddressChanged();
            }
        }
        private CommonAddress _Address;
        private bool _AddressInitialized;
        partial void OnAddressChanging(CommonAddress value);
        partial void OnAddressChanged();
    }
    /// <summary>
    /// There are no comments for NWComplexTypeModel.Customer in the schema.
    /// </summary>
    /// <KeyProperties>
    /// CustomerID
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="NWComplexTypeModel", Name="Customer")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Customer : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Customer object.
        /// </summary>
        /// <param name="customerID">Initial value of CustomerID.</param>
        /// <param name="companyName">Initial value of CompanyName.</param>
        /// <param name="address">Initial value of Address.</param>
        public static Customer CreateCustomer(string customerID, string companyName, CommonAddress address)
        {
            Customer customer = new Customer();
            customer.CustomerID = customerID;
            customer.CompanyName = companyName;
            customer.Address = global::System.Data.Objects.DataClasses.StructuralObject.VerifyComplexObjectIsNotNull(address, "Address");
            return customer;
        }
        /// <summary>
        /// There are no comments for Property CustomerID in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string CustomerID
        {
            get
            {
                return this._CustomerID;
            }
            set
            {
                this.OnCustomerIDChanging(value);
                this.ReportPropertyChanging("CustomerID");
                this._CustomerID = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("CustomerID");
                this.OnCustomerIDChanged();
            }
        }
        private string _CustomerID;
        partial void OnCustomerIDChanging(string value);
        partial void OnCustomerIDChanged();
        /// <summary>
        /// There are no comments for Property CompanyName in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string CompanyName
        {
            get
            {
                return this._CompanyName;
            }
            set
            {
                this.OnCompanyNameChanging(value);
                this.ReportPropertyChanging("CompanyName");
                this._CompanyName = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("CompanyName");
                this.OnCompanyNameChanged();
            }
        }
        private string _CompanyName;
        partial void OnCompanyNameChanging(string value);
        partial void OnCompanyNameChanged();
        /// <summary>
        /// There are no comments for Property Address in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmComplexPropertyAttribute()]
        [global::System.ComponentModel.DesignerSerializationVisibility(global::System.ComponentModel.DesignerSerializationVisibility.Content)]
        [global::System.Xml.Serialization.XmlElement(IsNullable=true)]
        [global::System.Xml.Serialization.SoapElement(IsNullable=true)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public CommonAddress Address
        {
            get
            {
                this._Address = this.GetValidValue(this._Address, "Address", false, this._AddressInitialized);
                this._AddressInitialized = true;
                return this._Address;
            }
            set
            {
                this.OnAddressChanging(value);
                this.ReportPropertyChanging("Address");
                this._Address = this.SetValidValue(this._Address, value, "Address");
                this._AddressInitialized = true;
                this.ReportPropertyChanged("Address");
                this.OnAddressChanged();
            }
        }
        private CommonAddress _Address;
        private bool _AddressInitialized;
        partial void OnAddressChanging(CommonAddress value);
        partial void OnAddressChanged();
    }
    /// <summary>
    /// There are no comments for ComplexType NWComplexTypeModel.CommonAddress in the schema.
    /// </summary>
    [global::System.Data.Objects.DataClasses.EdmComplexTypeAttribute(NamespaceName="NWComplexTypeModel", Name="CommonAddress")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class CommonAddress : global::System.Data.Objects.DataClasses.ComplexObject
    {
        /// <summary>
        /// There are no comments for Property Address in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Address
        {
            get
            {
                return this._Address;
            }
            set
            {
                this.OnAddressChanging(value);
                this.ReportPropertyChanging("Address");
                this._Address = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("Address");
                this.OnAddressChanged();
            }
        }
        private string _Address;
        partial void OnAddressChanging(string value);
        partial void OnAddressChanged();
        /// <summary>
        /// There are no comments for Property City in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string City
        {
            get
            {
                return this._City;
            }
            set
            {
                this.OnCityChanging(value);
                this.ReportPropertyChanging("City");
                this._City = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("City");
                this.OnCityChanged();
            }
        }
        private string _City;
        partial void OnCityChanging(string value);
        partial void OnCityChanged();
        /// <summary>
        /// There are no comments for Property Region in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Region
        {
            get
            {
                return this._Region;
            }
            set
            {
                this.OnRegionChanging(value);
                this.ReportPropertyChanging("Region");
                this._Region = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("Region");
                this.OnRegionChanged();
            }
        }
        private string _Region;
        partial void OnRegionChanging(string value);
        partial void OnRegionChanged();
        /// <summary>
        /// There are no comments for Property PostalCode in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string PostalCode
        {
            get
            {
                return this._PostalCode;
            }
            set
            {
                this.OnPostalCodeChanging(value);
                this.ReportPropertyChanging("PostalCode");
                this._PostalCode = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("PostalCode");
                this.OnPostalCodeChanged();
            }
        }
        private string _PostalCode;
        partial void OnPostalCodeChanging(string value);
        partial void OnPostalCodeChanged();
        /// <summary>
        /// There are no comments for Property Country in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Country
        {
            get
            {
                return this._Country;
            }
            set
            {
                this.OnCountryChanging(value);
                this.ReportPropertyChanging("Country");
                this._Country = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("Country");
                this.OnCountryChanged();
            }
        }
        private string _Country;
        partial void OnCountryChanging(string value);
        partial void OnCountryChanged();
    }
}
