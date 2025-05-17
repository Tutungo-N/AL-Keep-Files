codeunit 50156 AddMyToDoAssistedSetup
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", OnRegisterAssistedSetup, '', true, true)]
    local procedure OnRegisterAssistedSetup()
    var
        AssistedSetup: Codeunit "Guided Experience";
        GuidedExperienceType: Enum "Guided Experience Type";
        AssisstedSetupGroup: Enum "Assisted Setup Group";
        VideoCategory: Enum "Video Category";
    begin
        if not AssistedSetup.Exists(GuidedExperienceType::"Assisted Setup", ObjectType::Page, Page::MyToDoAssistedSetup) then
            AssistedSetup.InsertAssistedSetup('Add something',
                'Create an activity for your team',
                'Register a task and assign individuals', 1, ObjectType::Page,
                Page::MyToDoAssistedSetup, AssisstedSetupGroup::Tasks, '', VideoCategory::Uncategorized, '');

    end;
}