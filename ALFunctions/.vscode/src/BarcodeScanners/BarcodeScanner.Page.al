page 50141 "Camera Barcode Scanner"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Tasks;
    Caption = 'Camera Barcode Scanner Sample';


    layout
    {
        area(Content)
        {
            // Declare the user control based on the CameraBarcodeScannerProviderAddIn control add-in
            usercontrol(BarcodeControl; CameraBarcodeScannerProviderAddIn) // Step One
            {
                ApplicationArea = All;

                // The ControlAddInReady event is raised when the control add-in is ready to be used.
                trigger ControlAddInReady(IsSupported: Boolean)
                begin

                    // Set the CameraBarcodeScannerAvailable variable to the value of the IsSupported parameter
                    CameraBarcodeScannerAvailable := IsSupported; // Step Two

                end;

                // The BarcodeAvailable event is raised when a barcode is available.
                trigger BarcodeAvailable(Barcode: Text; Format: Text)
                begin
                    Message(Barcode); //Step Four

                    // Continuous scanning                    
                    // CurrPage.BarcodeControl.RequestBarcodeAsync(); // Step Five
                end;
                // The BarcodeFailure event is raised on a failure
                trigger BarcodeFailure(Failure: Enum BarcodeFailure)
                begin
                    case Failure of
                        Failure::Cancel:
                            Message('Cancelled.');
                        Failure::NoBarcode:
                            Message('No Barcode.');
                        Failure::Error:
                            Message('Error');

                    end;
                end;


            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ScanBarcode)
            {
                ApplicationArea = All;


                trigger OnAction()
                begin
                    // Request a barcode
                    CurrPage.BarcodeControl.RequestBarcodeAsync(); // Step Three
                end;
            }
        }
    }

    var
        CameraBarcodeScannerAvailable: Boolean;
}