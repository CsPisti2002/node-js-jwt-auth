-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Ápr 04. 12:47
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `zarodolgozat_adatb`
--
CREATE DATABASE IF NOT EXISTS `zarodolgozat_adatb` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `zarodolgozat_adatb`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kerdes`
--

CREATE TABLE `kerdes` (
  `komment_id` int(11) NOT NULL,
  `komment_nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `komment_szoveg` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `komment_datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kerdes`
--

INSERT INTO `kerdes` (`komment_id`, `komment_nev`, `komment_szoveg`, `komment_datum`) VALUES
(1, 'Balogh András', 'Szép és igényes munkát végeztek', '2022-02-18'),
(2, 'Lakatos Mária', 'Hanyag munkát végeztek', '2022-02-10'),
(5, 'Borbély Zsolt', 'Jó munkát végeztek!', '2022-04-02');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(2, 'moderator', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(3, 'admin', '2020-08-02 14:57:31', '2020-08-02 14:57:31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termekek`
--

CREATE TABLE `termekek` (
  `termek_id` int(11) NOT NULL,
  `termek_nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `termek_tipus` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `termek_info` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `termek_ar` int(11) NOT NULL,
  `kep_id` varchar(11) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `termekek`
--

INSERT INTO `termekek` (`termek_id`, `termek_nev`, `termek_tipus`, `termek_info`, `termek_ar`, `kep_id`) VALUES
(28, 'Prysmian Group Hajlékony MT vezeték (3x1.5mm2)', 'Kábel', 'kör keresztmetszetű', 310, 'pisti_1.jpg'),
(29, 'MBCU KÁBEL NYM-J 3X1', 'Kábel', 'Az MBCu kábelek alkalmazhatóak rögzített elhelyezéssel száraz és nedves belső terekben, épületek, ob', 187, 'pisti_2.jpg'),
(31, 'Stellar MBCU vezeték (3x2.5mm2)', 'Kábel', 'PVC szigetelésű, EPDM kiöltőanyaggal ellátott, 3 eres, tömör rézvezeték', 480, 'pisti_3.jpg'),
(33, 'MBCU-NYM-J 5x2,5mm2 ', 'Kábel', 'Beltérben rögzített állapotban. Kültéren vagy földbe (csak védőcsőbe húzva). Betonba, vagy vakolat a', 654, 'pisti_4.png'),
(34, ':MT 3x2,5mm2 kábel H05VV-', 'Kábel', 'A H05VV-F (MT) kábelek száraz és nedves helyeken, közepes mechanikai igénybevételre, olyan fogyasztó', 450, 'pisti_5.png'),
(35, 'Pawbol S-BOX 416 kötődoboz 190x140x70 IP55', 'Kötődoboz', 'Az S-Box kötődobozok megfelelnek a STN EN 60670-1 szabványnak. A dobozok belsejében kialakított horn', 1256, 'pisti_6.jpg'),
(37, 'Sorolható Szerelvénydoboz, 65mm-Es Átmérő', 'Kötődoboz', '41mm Mély, Fekete, IP20, 5201H', 3683, 'pisti_7.jpg'),
(38, 'Műanyag Komplett Doboz', 'Doboz', '100mm,IP20,Vakolat Alá', 1000, 'pisti_8.jpg'),
(39, 'Kötődoboz.75x75x37mm', 'Doboz', '---------', 250, 'pisti_9.jpg'),
(41, 'Műanyag kötődoboz Müds 80-as szerelvény doboz rugós fedéllel', 'Doboz', '----------', 250, 'pisti_10.jp'),
(42, 'Lépésálló gégecső 16mm fekete', 'Cső', 'Az árat méterenként kell számolni', 60, 'pisti_11.pn'),
(43, 'Budvill MÜ III-as 16-os védőcső 2.5m', 'Cső', 'Kedvező tulajdonsága a korlátlan élettartam', 210, 'pisti_15.jp');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'user', 'user', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'mod', 'mod', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'admin', 'admin', '$2a$08$97Ze1/hXfOX44WdC62Rq8uRkog9HYC1HukRX8eld2ZEKPyenM5v.G', '2020-08-02 15:03:59', '2020-08-02 15:03:59');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 1, 3),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 2),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 3, 3);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `kerdes`
--
ALTER TABLE `kerdes`
  ADD PRIMARY KEY (`komment_id`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`termek_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `kerdes`
--
ALTER TABLE `kerdes`
  MODIFY `komment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `termekek`
--
ALTER TABLE `termekek`
  MODIFY `termek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
