// Copyright 1998-2016 Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;

public class RedStone : ModuleRules
{
	public RedStone(TargetInfo Target)
	{
		PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore", "HeadMountedDisplay" });
        PrivateDependencyModuleNames.AddRange(
            new string[] {
                        "Slate",
                        "SlateCore",
                        "UMG",
            }
        );
    }
}
