# AI Travel Assistant

**AI Travel Assistant** — Buxoro bo'yicha aqlli sayohat yordamchisi: xarita, marshrutlar, tarixiy obidalar va mahalliy xizmatlar. **O'zbek, rus va ingliz** tillarida.

## Tillar

Bosh sahifada: **Oʻzbek** | **Русский** | **English**

Tanlangan til saqlanadi va barcha matnlar shu tilda ko'rsatiladi.

## APK yig'ish

### Tez usul: `build-apk.ps1`

```powershell
cd c:\1111111\buxoro-tarix
.\build-apk.ps1
```

Android Studio o'rnatilgan bo'lsa, `AITravelAssistant-debug.apk` papkada paydo bo'ladi.

### GitHub Actions (kompyuterda SDK shart emas)

1. Loyihani GitHub ga yuklang
2. **Actions** → **Build Android APK** → **Run workflow**
3. Tugagach **AITravelAssistant-apk** artifact dan APK ni yuklab oling

### EAS Build (bulut)

```bash
cd buxoro-tarix
npm install
npx eas login
npx eas build -p android --profile preview
```

### Expo Go (tezkor sinov)

```bash
npm install
npx expo start
```

Telefonda Expo Go + QR-kod.

## Imkoniyatlar

- AI tavsiya qilingan sayohat marshrutlari
- 18 ta Buxoro tarixiy obidasi
- Oflayn xarita (~4 MB)
- 3 til: uz / ru / en
- Masofa, yo'nalish, xizmatlar (ovqat, mehmonxona, EV zaryadlash va boshqalar)
- Google Maps / Yandex Maps integratsiyasi
