# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.32
# 

Name:       harbour-dwd

# >> macros
# << macros

%{!?qtc_qmake:%define qtc_qmake %qmake}
%{!?qtc_qmake5:%define qtc_qmake5 %qmake5}
%{!?qtc_make:%define qtc_make make}
%{?qtc_builddir:%define _builddir %qtc_builddir}

Summary:    German Weather Service client
Version:    0.8.2
Release:    1
Group:      Applications/Internet
License:    GPLv3
URL:        https://github.com/poetaster/harbour-dwd
Source0:    %{name}-%{version}.tar.bz2
Requires:   sailfishsilica-qt5 >= 1.1.0
BuildRequires:  qt5-qttools-linguist
BuildRequires:  pkgconfig(sailfishapp)
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  desktop-file-utils

%description
This German Weather Service client uses the brightsky.dev version of the DWD raw data

%if "%{?vendor}" == "chum"
PackageName: German Weather Service
Type: desktop-application
Categories:
 - Science
 - Physics
 - News
DeveloperName: Mark Washeim 
Custom:
 - RepoType: github
 - Repo: https://github.com/poetaster/harbour-dwd
Icon: https://raw.githubusercontent.com/poetaster/harbour-dwd/master/icons/172x172/harbour-dwd.png
Screenshots:
 - https://raw.githubusercontent.com/poetaster/harbour-dwd/main/screen1.png
 - https://raw.githubusercontent.com/poetaster/harbour-dwd/main/screen2.png
 - https://raw.githubusercontent.com/poetaster/harbour-dwd/main/screen3.png
Url:
  Homepage: https://github.com/poetaster/harbour-dwd
  Help: https://github.com/poetaster/harbour-dwd/discussions
  Bugtracker: https://github.com/poetaster/harbour-dwd/issues
  Donation: https://www.paypal.me/poetasterFOSS
%endif

%prep
%setup -q -n %{name}-%{version}

# >> setup
# << setup

%build
# >> build pre
# << build pre

%qtc_qmake5 

%qtc_make %{?_smp_mflags}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre
%qmake5_install

# >> install post
# << install post

desktop-file-install --delete-original       \
  --dir %{buildroot}%{_datadir}/applications             \
   %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%{_datadir}/%{name}
%{_datadir}/icons/hicolor/*/apps/%{name}.png
%{_datadir}/applications/%{name}.desktop
%{_datadir}/%{name}/qml
%{_bindir}/%{name}
# >> files
# << files
