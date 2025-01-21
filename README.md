# Galloo_carspublic

# 🚗 Vehicle Skill Check Script

Enhance your FiveM server with a unique skill check mechanic for vehicle interactions! This script supports both ESX and QB-Core frameworks and uses the powerful ox_lib for seamless skill checks.

## ✨ Features

- 🔄 **Framework Support**: Works with both ESX and QB-Core.
- 🎯 **Skill Check Levels**: Adjustable difficulty for different scenarios.
- 📢 **Custom Notifications**: Framework-specific success and failure messages.
- 🚫 **Vehicle Lock Mechanic**: Damages and disables vehicles upon failed attempts.
- ⚙️ **Powered by ox_lib**: Utilizes lib.skillCheck for interactive challenges.

## ⚙️ Configuration

### 1️⃣ Select Your Framework

Set the framework in the script:

```lua
Shr.framework = 'esx'  -- Options: 'esx' or 'qbcore'
```

### 2️⃣ Customize Skill Check Levels

Adjust difficulty settings to fit your server:

```lua
Shr.skillCheckLevels = {'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'hard'}
```

- 🟢 **Easy (easy)** – Basic challenge.
- 🟡 **Intermediate (Object)** – Customize areaSize (skill radius) and speedMultiplier (speed of indicator).
- 🔴 **Hard (hard)** – For experienced players.

### 3️⃣ Define Skill Check Keys

Choose the keys players will use during the challenge:

```lua
Shr.skillCheckKeys = {'w', 'a', 's', 'd'}
```

### 4️⃣ Install Dependencies

Ensure the following resources are installed:

- 🔧 **ESX Framework**: es_extended
- 🔧 **QB-Core Framework**: qb-core
- 🔧 **ox_lib**: Required for skill checks.

## 🕹️ How It Works

### 🚪 Vehicle Interaction

When a player tries to enter a locked or NPC-driven vehicle, a skill check is triggered.

#### ✅ Success

- Player gains access to the vehicle.
- Any NPC driver will be removed.

#### ❌ Failure

- The vehicle becomes undrivable and takes engine damage.
- Custom notifications inform the player of the failure.

## 📝 Code Highlights

### Notifications

Easily customize the messages for success or failure:

```lua
if Shr.framework == 'esx' then
    ESX.ShowNotification("Your custom message here")
elseif Shr.framework == 'qbcore' then
    QBCore.Functions.Notify("Your custom message here", "type")
end
```

### ox_lib Integration

The script uses ox_lib for its skill check system:

```lua
local success = lib.skillCheck(Shr.skillCheckLevels, Shr.skillCheckKeys)
```

## 💡 Tips for Server Owners

- 🛠️ **Balance Difficulty**: Adjust Shr.skillCheckLevels to suit your server's player base.
- 🔒 **Roleplay-Ready**: Use this script to enhance immersive scenarios like vehicle thefts or high-stakes missions.
- 🌟 **Extend Features**: Add rewards or penalties based on success or failure.

## 📜 License

This script is for educational purposes and private server use only. Redistribution without permission is not allowed.
